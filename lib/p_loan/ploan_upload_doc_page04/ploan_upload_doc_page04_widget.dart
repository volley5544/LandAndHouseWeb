import '/components/error_message_component_widget.dart';
import '/components/open_image_component_widget.dart';
import '/customer_topup/camera_trigger_component/camera_trigger_component_widget.dart';
import '/customer_topup/full_vehicle_image_example/full_vehicle_image_example_widget.dart';
import '/customer_topup/loan_detail_card_topup_component/loan_detail_card_topup_component_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'ploan_upload_doc_page04_model.dart';
export 'ploan_upload_doc_page04_model.dart';

class PloanUploadDocPage04Widget extends StatefulWidget {
  const PloanUploadDocPage04Widget({super.key});

  static String routeName = 'PloanUploadDocPage04';
  static String routePath = '/PloanUploadDocPage04';

  @override
  State<PloanUploadDocPage04Widget> createState() =>
      _PloanUploadDocPage04WidgetState();
}

class _PloanUploadDocPage04WidgetState
    extends State<PloanUploadDocPage04Widget> {
  late PloanUploadDocPage04Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PloanUploadDocPage04Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent(
        'topup_step3',
        parameters: {
          'hash_id': FFAppState().hashThaiIdAppState,
        },
      );
      await Future.wait([
        Future(() async {
          while (true) {
            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 1000,
              ),
            );
          }
        }),
        Future(() async {
          await actions.listenWebviewEventCamera(
            context,
            (cameraBase64, actionNameOutput) async {
              if (actionNameOutput == 'fullVehicleCamera') {
                _model.fullVehicleBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateFullVehicleFile =
                    await actions.convertBase64ToFFFiles(
                  _model.fullVehicleBase64,
                  '01',
                );
                _model.fullVehicleImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateFullVehicleFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.fullVehicleFile = _model.generateFullVehicleFile;
                safeSetState(() {});
                _model.fullVehicleImageUrl = functions
                    .stringToImgPath(_model.fullVehicleImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'circleCamera') {
                _model.circleBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateCircleFile =
                    await actions.convertBase64ToFFFiles(
                  _model.circleBase64,
                  '01',
                );
                _model.circleImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateCircleFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.circleFile = _model.generateCircleFile;
                safeSetState(() {});
                _model.circleImageUrl =
                    functions.stringToImgPath(_model.circleImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'leftCamera') {
                _model.leftBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateLeftFile = await actions.convertBase64ToFFFiles(
                  _model.leftBase64,
                  '01',
                );
                _model.leftImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateLeftFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.leftFile = _model.generateLeftFile;
                safeSetState(() {});
                _model.imageLeft =
                    functions.stringToImgPath(_model.leftImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'rightCamera') {
                _model.rightBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateRightFile = await actions.convertBase64ToFFFiles(
                  _model.rightBase64,
                  '01',
                );
                _model.rightImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateRightFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.rightFile = _model.generateRightFile;
                safeSetState(() {});
                _model.imageRight =
                    functions.stringToImgPath(_model.rightImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'frontCamera') {
                _model.frontBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateFrontFile = await actions.convertBase64ToFFFiles(
                  _model.frontBase64,
                  '01',
                );
                _model.frontImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateFrontFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.frontFile = _model.generateFrontFile;
                safeSetState(() {});
                _model.imageFront =
                    functions.stringToImgPath(_model.frontImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'backCamera') {
                _model.backBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateBackFile = await actions.convertBase64ToFFFiles(
                  _model.backBase64,
                  '01',
                );
                _model.backImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateBackFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.backFile = _model.generateBackFile;
                safeSetState(() {});
                _model.imageBack =
                    functions.stringToImgPath(_model.backImageUrlCallback)!;
                safeSetState(() {});
              } else if (actionNameOutput == 'mileCamera') {
                _model.mileBase64 = cameraBase64;
                safeSetState(() {});
                _model.generateMileFile = await actions.convertBase64ToFFFiles(
                  _model.mileBase64,
                  '01',
                );
                _model.mileImageUrlCallback =
                    await actions.uploadFileFirebaseStorage(
                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                  _model.generateMileFile,
                  FFAppState().getLoanListSelected.contractNo,
                  FFAppState().hashThaiIdAppState,
                );
                _model.mileFile = _model.generateMileFile;
                safeSetState(() {});
                _model.imageMile =
                    functions.stringToImgPath(_model.mileImageUrlCallback)!;
                safeSetState(() {});
              }
            },
          );
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => Title(
          title: 'PloanUploadDocPage04',
          color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'ข้อมูลการต่อภาษี',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.loanDetailCardTopupComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: LoanDetailCardTopupComponentWidget(
                          contNo: '${valueOrDefault<String>(
                            FFAppState()
                                .getTopupDataAPIResultAppstate
                                .contractNo,
                            'contract_no',
                          )}',
                          assetCode: '${valueOrDefault<String>(
                            FFAppState()
                                .getTopupDataAPIResultAppstate
                                .contractDetails
                                .collateralInformation,
                            'collateral_information',
                          )}',
                          productTypeCode: '${valueOrDefault<String>(
                            FFAppState()
                                .getLoanListSelected
                                .contractDetails
                                .loanTypeCode,
                            'loan_type_code',
                          )}',
                          assetName: '${valueOrDefault<String>(
                            FFAppState()
                                .getLoanListSelected
                                .contractDetails
                                .loanTypeName,
                            'loan_type_name',
                          )}',
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'ทะเบียนจังหวัด',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .carDetails
                                            .carProvince,
                                        'car_province',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'วันหมดอายุทะเบียน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${FFAppState().getTopupDataAPIResultAppstate.contractDetails.licensePlateExpireDate}' !=
                                              ''
                                          ? '${valueOrDefault<String>(
                                              functions.parseDateTimeToString(
                                                  '${FFAppState().getTopupDataAPIResultAppstate.contractDetails.licensePlateExpireDate}'),
                                              'license_plate_expire_date',
                                            )}'
                                          : '',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'ยี่ห้อสินค้า',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .contractDetails
                                            .vehicleBrand,
                                        'vehicle_brand',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'รุ่นสินค้า',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${valueOrDefault<String>(
                                        FFAppState()
                                            .getTopupDataAPIResultAppstate
                                            .carDetails
                                            .carSeries,
                                        'car_series',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'M')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            flex: 9,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    content: Text(
                                                                        functions
                                                                            .imagePathToString(_model.fullVehicleImageUrl)!),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'launch'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'openImage'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    OpenImageComponentWidget(
                                                                  imageUrl: _model
                                                                      .fullVehicleImageUrl,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        await Clipboard.setData(
                                                            ClipboardData(
                                                                text: functions
                                                                    .imagePathToString(
                                                                        functions
                                                                            .stringToImgPath(_model.fullVehicleImageUrlOutput))!));
                                                        await launchURL(functions
                                                            .imagePathToString(
                                                                _model
                                                                    .fullVehicleImageUrl)!);
                                                      }
                                                    },
                                                    child: Text(
                                                      'บังคับถ่ายรูปภาพหลักประกันเต็มคันมองเห็นป้ายทะเบียนชัดเจน*',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Noto San Thai',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child:
                                                              FullVehicleImageExampleWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidQuestionCircle,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.fullVehicleImageUrl ==
                                                'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'fullVehicleCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_fullVehicleImageUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_fullVehicleImageUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_fullVehicleImageUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_fullVehicleImageUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.fullVehicleImageUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                    _model
                                                        .uploadedLocalFile_fullVehicleImageUploadActionPL,
                                                    FFAppState()
                                                        .getLoanListSelected
                                                        .contractNo,
                                                    FFAppState()
                                                        .hashThaiIdAppState,
                                                  );
                                                  _shouldSetState = true;
                                                  _model.fullVehicleImageUrl =
                                                      functions.stringToImgPath(
                                                          _model
                                                              .fullVehicleImageUrlOutput)!;
                                                  _model.fullVehicleFile = _model
                                                      .uploadedLocalFile_fullVehicleImageUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.fullVehicleFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag1',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag1',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.fullVehicleFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.fullVehicleImageUrl =
                                                              'url';
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'C')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'บังคับถ่ายรูปด้านข้างขวาเต็มคัน*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.imageRight == 'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'rightCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_imageRightUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_imageRightUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_imageRightUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_imageRightUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.imageRightUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'TopupM',
                                                    _model
                                                        .uploadedLocalFile_imageRightUploadActionPL,
                                                    'ญฟC670301001NE54X',
                                                    '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                  );
                                                  _shouldSetState = true;
                                                  _model.imageRight = functions
                                                      .stringToImgPath(_model
                                                          .imageRightUrlOutput)!;
                                                  _model.rightFile = _model
                                                      .uploadedLocalFile_imageRightUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.rightFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag2',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag2',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.rightFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.imageRight =
                                                              'url';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_imageRightUploadActionPL =
                                                                false;
                                                            _model.uploadedLocalFile_imageRightUploadActionPL =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'C')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'บังคับถ่ายรูปด้านข้างซ้ายเต็มคัน*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.imageLeft == 'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'leftCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_imageLeftUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_imageLeftUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_imageLeftUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_imageLeftUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.leftImageUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'TopupC',
                                                    _model
                                                        .uploadedLocalFile_imageLeftUploadActionPL,
                                                    'ญฟC670301001NE54X',
                                                    '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                  );
                                                  _shouldSetState = true;
                                                  _model.imageLeft = functions
                                                      .stringToImgPath(_model
                                                          .leftImageUrlOutput)!;
                                                  _model.leftFile = _model
                                                      .uploadedLocalFile_imageLeftUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.leftFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag3',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag3',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.leftFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.imageLeft =
                                                              'url';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_imageLeftUploadActionPL =
                                                                false;
                                                            _model.uploadedLocalFile_imageLeftUploadActionPL =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'C')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'บังคับถ่ายรูปด้านหน้าตรงเต็มคันมองเห็นป้ายทะเบียนชัดเจน*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.imageFront == 'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'frontCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_imageFrontUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_imageFrontUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_imageFrontUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_imageFrontUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.imageFrontUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'TopupM',
                                                    _model
                                                        .uploadedLocalFile_imageFrontUploadActionPL,
                                                    'ญฟC670301001NE54X',
                                                    '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                  );
                                                  _shouldSetState = true;
                                                  _model.imageFront = functions
                                                      .stringToImgPath(_model
                                                          .imageFrontUrlOutput)!;
                                                  _model.frontFile = _model
                                                      .uploadedLocalFile_imageFrontUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.frontFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag4',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag4',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.frontFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.imageFront =
                                                              'url';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_imageFrontUploadActionPL =
                                                                false;
                                                            _model.uploadedLocalFile_imageFrontUploadActionPL =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'C')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'บังคับถ่ายรูปด้านหลังตรงเต็มคันมองเห็นป้ายทะเบียนชัดเจน*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.imageBack == 'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'backCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_imageBackUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_imageBackUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_imageBackUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_imageBackUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.imageBackUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'TopupM',
                                                    _model
                                                        .uploadedLocalFile_imageBackUploadActionPL,
                                                    'ญฟC670301001NE54X',
                                                    '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                  );
                                                  _shouldSetState = true;
                                                  _model.imageBack = functions
                                                      .stringToImgPath(_model
                                                          .imageBackUrlOutput)!;
                                                  _model.backFile = _model
                                                      .uploadedLocalFile_imageBackUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.backFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag5',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag5',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.backFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.imageBack =
                                                              'url';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_imageBackUploadActionPL =
                                                                false;
                                                            _model.uploadedLocalFile_imageBackUploadActionPL =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            if (FFAppState()
                                    .getLoanListSelected
                                    .contractDetails
                                    .loanTypeCode ==
                                'C')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Text(
                                          'บังคับถ่ายรูปภาพเลขไมล์*',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Noto San Thai',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.imageMile == 'url') {
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  await actions
                                                      .clearImageCache();
                                                  if (FFAppState()
                                                      .useNewCameraAction) {
                                                    await actions
                                                        .openCameraWebview(
                                                      'normal',
                                                      'mileCamera',
                                                    );
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 1920.00,
                                                    maxHeight: 1920.00,
                                                    imageQuality: 50,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_imageMileUploadActionPL =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_imageMileUploadActionPL =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_imageMileUploadActionPL =
                                                            selectedUploadedFiles
                                                                .first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (!((_model
                                                              .uploadedLocalFile_imageMileUploadActionPL
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false))) {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                  _model.imageMileUrlOutput =
                                                      await actions
                                                          .uploadFileFirebaseStorage(
                                                    'TopupM',
                                                    _model
                                                        .uploadedLocalFile_imageMileUploadActionPL,
                                                    'ญฟC670301001NE54X',
                                                    '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                                  );
                                                  _shouldSetState = true;
                                                  _model.imageMile = functions
                                                      .stringToImgPath(_model
                                                          .imageMileUrlOutput)!;
                                                  _model.mileFile = _model
                                                      .uploadedLocalFile_imageMileUploadActionPL;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'ถ่ายรูปภาพ',
                                                icon: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 60.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFE8F3FB),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Noto San Thai',
                                                        color:
                                                            Color(0xFF1D71B8),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 250.0,
                                                height: 250.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.memory(
                                                                _model.mileFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                fit: BoxFit
                                                                    .contain,
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Image.asset(
                                                                  'assets/images/error_image.png',
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: 'imageTag6',
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: 'imageTag6',
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.memory(
                                                            _model.mileFile
                                                                    ?.bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 250.0,
                                                              height: 250.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 50.0,
                                                        buttonSize: 35.0,
                                                        fillColor:
                                                            Color(0x98000000),
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.imageMile =
                                                              'url';
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model.isDataUploading_imageMileUploadActionPL =
                                                                false;
                                                            _model.uploadedLocalFile_imageMileUploadActionPL =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ].addToEnd(SizedBox(height: 30.0)),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Text(
                                        'บังคับถ่ายรูปภาพป้ายวงกลม*',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Noto San Thai',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.circleImageUrl == 'url') {
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                await actions.clearImageCache();
                                                if (FFAppState()
                                                    .useNewCameraAction) {
                                                  await actions
                                                      .openCameraWebview(
                                                    'normal',
                                                    'circleCamera',
                                                  );
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                final selectedMedia =
                                                    await selectMedia(
                                                  maxWidth: 1920.00,
                                                  maxHeight: 1920.00,
                                                  imageQuality: 50,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  safeSetState(() => _model
                                                          .isDataUploading_circleImageUploadActionPL =
                                                      true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                  originalFilename:
                                                                      m.originalFilename,
                                                                ))
                                                            .toList();
                                                  } finally {
                                                    _model.isDataUploading_circleImageUploadActionPL =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length) {
                                                    safeSetState(() {
                                                      _model.uploadedLocalFile_circleImageUploadActionPL =
                                                          selectedUploadedFiles
                                                              .first;
                                                    });
                                                  } else {
                                                    safeSetState(() {});
                                                    return;
                                                  }
                                                }

                                                if (!((_model.uploadedLocalFile_circleImageUploadActionPL
                                                            .bytes?.isNotEmpty ??
                                                        false))) {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.circleImageUrlOutput =
                                                    await actions
                                                        .uploadFileFirebaseStorage(
                                                  'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                  _model
                                                      .uploadedLocalFile_circleImageUploadActionPL,
                                                  FFAppState()
                                                      .getLoanListSelected
                                                      .contractNo,
                                                  FFAppState()
                                                      .hashThaiIdAppState,
                                                );
                                                _shouldSetState = true;
                                                _model.circleImageUrl = functions
                                                    .stringToImgPath(_model
                                                        .circleImageUrlOutput)!;
                                                _model.circleFile = _model
                                                    .uploadedLocalFile_circleImageUploadActionPL;
                                                safeSetState(() {});
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: 'ถ่ายรูปภาพ',
                                              icon: Icon(
                                                Icons.camera_alt_outlined,
                                                size: 24.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFE8F3FB),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Noto San Thai',
                                                          color:
                                                              Color(0xFF1D71B8),
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: 250.0,
                                              height: 250.0,
                                              child: Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image: Image.memory(
                                                              _model.circleFile
                                                                      ?.bytes ??
                                                                  Uint8List
                                                                      .fromList(
                                                                          []),
                                                              fit: BoxFit
                                                                  .contain,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.png',
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: 'imageTag7',
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: 'imageTag7',
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.memory(
                                                          _model.circleFile
                                                                  ?.bytes ??
                                                              Uint8List
                                                                  .fromList([]),
                                                          width: 250.0,
                                                          height: 250.0,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 250.0,
                                                            height: 250.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 50.0,
                                                      buttonSize: 35.0,
                                                      fillColor:
                                                          Color(0x98000000),
                                                      icon: Icon(
                                                        Icons.close_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.circleImageUrl =
                                                            'url';
                                                        safeSetState(() {});
                                                        safeSetState(() {
                                                          _model.isDataUploading_circleImageUploadActionPL =
                                                              false;
                                                          _model.uploadedLocalFile_circleImageUploadActionPL =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []),
                                                                  originalFilename:
                                                                      '');
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 30.0)),
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    if (FFAppState()
                                            .getLoanListSelected
                                            .contractDetails
                                            .loanTypeCode ==
                                        'M') {
                                      return ((_model.fullVehicleImageUrl ==
                                              'url') ||
                                          (_model.circleImageUrl == 'url'));
                                    } else if (FFAppState()
                                            .getLoanListSelected
                                            .contractDetails
                                            .loanTypeCode ==
                                        'C') {
                                      return ((_model.imageFront == 'url') ||
                                          (_model.circleImageUrl == 'url') ||
                                          (_model.imageBack == 'url') ||
                                          (_model.imageLeft == 'url') ||
                                          (_model.imageRight == 'url') ||
                                          (_model.imageMile == 'url'));
                                    } else {
                                      return true;
                                    }
                                  }()
                                      ? null
                                      : () async {
                                          var _shouldSetState = false;
                                          if (FFAppState()
                                                  .getLoanListSelected
                                                  .contractDetails
                                                  .loanTypeCode ==
                                              'M') {
                                            if (_model.fullVehicleImageUrl ==
                                                'url') {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CameraTriggerComponentWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () =>
                                                      _model.vehicleImageFile =
                                                          value));

                                              _shouldSetState = true;
                                              if (!(_model.vehicleImageFile !=
                                                      null &&
                                                  (_model.vehicleImageFile
                                                          ?.bytes?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'บังคับถ่ายรูปภาพหลักประกันเต็มคันมองเห็นป้ายทะเบียนชัดเจน',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.fullVehicleImageUrlOutputButton =
                                                  await actions
                                                      .uploadFileFirebaseStorage(
                                                'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                _model.vehicleImageFile,
                                                FFAppState()
                                                    .getLoanListSelected
                                                    .contractNo,
                                                FFAppState().hashThaiIdAppState,
                                              );
                                              _shouldSetState = true;
                                              _model.fullVehicleImageUrl =
                                                  functions.stringToImgPath(_model
                                                      .fullVehicleImageUrlOutputButton)!;
                                              _model.fullVehicleFile =
                                                  _model.vehicleImageFile;
                                              _model.isLoad = true;
                                              safeSetState(() {});
                                            }
                                            if (_model.circleImageUrl ==
                                                'url') {
                                              if (_model.isLoad) {
                                                await Future.delayed(
                                                  Duration(
                                                    milliseconds: 1000,
                                                  ),
                                                );
                                              }
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CameraTriggerComponentWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model.circleImageFile =
                                                      value));

                                              _shouldSetState = true;
                                              if (!(_model.circleImageFile !=
                                                      null &&
                                                  (_model.circleImageFile?.bytes
                                                          ?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'บังคับถ่ายรูปภาพป้ายวงกลม',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.circleImageImageUrlOutputButton =
                                                  await actions
                                                      .uploadFileFirebaseStorage(
                                                'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                _model.circleImageFile,
                                                FFAppState()
                                                    .getLoanListSelected
                                                    .contractNo,
                                                FFAppState().hashThaiIdAppState,
                                              );
                                              _shouldSetState = true;
                                              _model.circleImageUrl = functions
                                                  .stringToImgPath(_model
                                                      .circleImageImageUrlOutputButton)!;
                                              _model.circleFile =
                                                  _model.circleImageFile;
                                              safeSetState(() {});
                                            }
                                            await Future.wait([
                                              Future(() async {
                                                _model.fullVehicleImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.fullVehicleFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.circleImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.circleFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                            ]);
                                            FFAppState()
                                                .updateSaveTopupDataStruct(
                                              (e) => e
                                                ..propertyImage = _model
                                                    .fullVehicleImageBase64
                                                ..actImage =
                                                    _model.circleImageBase64
                                                ..carImageFront = ''
                                                ..carImageBack = ''
                                                ..carImageLeft = ''
                                                ..carImageRight = ''
                                                ..carImageMile = '',
                                            );
                                            safeSetState(() {});
                                          } else {
                                            if (_model.circleImageUrl ==
                                                'url') {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CameraTriggerComponentWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () =>
                                                      _model.circleCImageFile =
                                                          value));

                                              _shouldSetState = true;
                                              if (!(_model.circleCImageFile !=
                                                      null &&
                                                  (_model.circleCImageFile
                                                          ?.bytes?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'บังคับถ่ายรูปภาพป้ายวงกลม',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.circleCImageUrlOutputButton =
                                                  await actions
                                                      .uploadFileFirebaseStorage(
                                                'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                _model.circleCImageFile,
                                                FFAppState()
                                                    .getLoanListSelected
                                                    .contractNo,
                                                FFAppState().hashThaiIdAppState,
                                              );
                                              _shouldSetState = true;
                                              _model.circleImageUrl = functions
                                                  .stringToImgPath(_model
                                                      .circleCImageUrlOutputButton)!;
                                              _model.circleFile =
                                                  _model.circleCImageFile;
                                              _model.isLoad = true;
                                              safeSetState(() {});
                                            }
                                            if (_model.imageRight == 'url') {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                isDismissible: false,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          CameraTriggerComponentWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model.rightImageFile =
                                                      value));

                                              _shouldSetState = true;
                                              if (!(_model.rightImageFile !=
                                                      null &&
                                                  (_model.rightImageFile?.bytes
                                                          ?.isNotEmpty ??
                                                      false))) {
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child:
                                                            ErrorMessageComponentWidget(
                                                          textMessage:
                                                              'บังคับถ่ายรูปด้านข้างซ้ายเต็มคัน',
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }
                                              _model.rightImageUrlOutputButton =
                                                  await actions
                                                      .uploadFileFirebaseStorage(
                                                'Topup${FFAppState().getLoanListSelected.contractDetails.loanTypeCode}',
                                                _model.rightImageFile,
                                                FFAppState()
                                                    .getLoanListSelected
                                                    .contractNo,
                                                FFAppState().hashThaiIdAppState,
                                              );
                                              _shouldSetState = true;
                                              _model.isLoad = true;
                                              _model.imageRight = functions
                                                  .stringToImgPath(_model
                                                      .rightImageUrlOutputButton)!;
                                              _model.rightFile =
                                                  _model.rightImageFile;
                                              safeSetState(() {});
                                            }
                                            if (_model.imageLeft == 'url') {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ErrorMessageComponentWidget(
                                                        textMessage:
                                                            'บังคับถ่ายรูปด้านข้างขวาเต็มคัน',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                            if (_model.imageFront == 'url') {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ErrorMessageComponentWidget(
                                                        textMessage:
                                                            'บังคับถ่ายรูปด้านหน้าตรงเต็มคันมองเห็นป้ายทะเบียนชัดเจน',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                            if (_model.imageBack == 'url') {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ErrorMessageComponentWidget(
                                                        textMessage:
                                                            'บังคับถ่ายรูปด้านหลังตรงเต็มคันมองเห็นป้ายทะเบียนชัดเจน',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                            if (_model.imageMile == 'url') {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          ErrorMessageComponentWidget(
                                                        textMessage:
                                                            'บังคับถ่ายรูปภาพเลขไมล์',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                            await Future.wait([
                                              Future(() async {
                                                _model.circleImageBase64C =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.circleFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.rightImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.rightFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.leftImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.leftFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.frontImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.frontFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.backImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.backFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                              Future(() async {
                                                _model.mileImageBase64 =
                                                    await actions
                                                        .encodeBase64FromFFFile(
                                                  _model.mileFile,
                                                );
                                                _shouldSetState = true;
                                              }),
                                            ]);
                                            FFAppState()
                                                .updateSaveTopupDataStruct(
                                              (e) => e
                                                ..actImage =
                                                    _model.circleImageBase64C
                                                ..carImageFront =
                                                    _model.frontImageBase64
                                                ..carImageBack =
                                                    _model.backImageBase64
                                                ..carImageLeft =
                                                    _model.leftImageBase64
                                                ..carImageRight =
                                                    _model.rightImageBase64
                                                ..carImageMile =
                                                    _model.mileImageBase64
                                                ..propertyImage = '',
                                            );
                                            safeSetState(() {});
                                          }

                                          context.pushNamed(
                                            PloanCustomerDataPage05Widget
                                                .routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType
                                                        .rightToLeft,
                                              ),
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                  text: 'ยืนยัน',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                    disabledColor: Color(0x7FDB771A),
                                  ),
                                ),
                              ),
                            ),
                          ].addToEnd(SizedBox(height: 50.0)),
                        ),
                      ),
                    ]
                        .addToStart(SizedBox(height: 8.0))
                        .addToEnd(SizedBox(height: 30.0)),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
