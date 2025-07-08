import '/customer_topup/loan_detail_card_component/loan_detail_card_component_widget.dart';
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
import 'package:provider/provider.dart';
import 'tax_detail_data_page_model.dart';
export 'tax_detail_data_page_model.dart';

class TaxDetailDataPageWidget extends StatefulWidget {
  const TaxDetailDataPageWidget({super.key});

  static String routeName = 'TaxDetailDataPage';
  static String routePath = '/taxDetailDataPage';

  @override
  State<TaxDetailDataPageWidget> createState() =>
      _TaxDetailDataPageWidgetState();
}

class _TaxDetailDataPageWidgetState extends State<TaxDetailDataPageWidget> {
  late TaxDetailDataPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaxDetailDataPageModel());

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

    return GestureDetector(
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
                  model: _model.loanDetailCardComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoanDetailCardComponentWidget(
                    contNo: valueOrDefault<String>(
                      FFAppState().getTopupDataAPIResultAppstate.contractNo,
                      'contract_no',
                    ),
                    assetCode: valueOrDefault<String>(
                      FFAppState()
                          .getTopupDataAPIResultAppstate
                          .contractDetails
                          .collateralInformation,
                      'collateral_information',
                    ),
                    productTypeCode: valueOrDefault<String>(
                      FFAppState()
                          .getLoanListSelected
                          .contractDetails
                          .loanTypeCode,
                      'loan_type_code',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .carDetails
                                      .carProvince,
                                  'car_province',
                                ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions.parseDateTimeToString(FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .contractDetails
                                      .licensePlateExpireDate),
                                  'license_plate_expire_date',
                                ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .contractDetails
                                      .vehicleBrand,
                                  'vehicle_brand',
                                ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .getTopupDataAPIResultAppstate
                                      .carDetails
                                      .carSeries,
                                  'car_series',
                                ),
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
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Text(
                                    'บังคับถ่ายรูปภาพหลักประกันเต็มคัน*',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.fullVehicleImageUrl == 'url') {
                                      return FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          final selectedMedia =
                                              await selectMedia(
                                            imageQuality: 30,
                                            multiImage: false,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() => _model
                                                    .isDataUploading_fullVehicleImageUploadAction =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading_fullVehicleImageUploadAction =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_fullVehicleImageUploadAction =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (!((_model.uploadedLocalFile_fullVehicleImageUploadAction
                                                      .bytes?.isNotEmpty ??
                                                  false))) {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          _model.fullVehicleImageUrlOutput =
                                              await actions
                                                  .uploadFileFirebaseStorage(
                                            'TopupM',
                                            _model
                                                .uploadedLocalFile_fullVehicleImageUploadAction,
                                            'ญฟC670301001NE54X',
                                            '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                          );
                                          _shouldSetState = true;
                                          _model.fullVehicleImageUrl =
                                              functions.stringToImgPath(_model
                                                  .fullVehicleImageUrlOutput)!;
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFE8F3FB),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0xFF1D71B8),
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: Image.network(
                                                        getCORSProxyUrl(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .fullVehicleImageUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                          ),
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: valueOrDefault<
                                                          String>(
                                                        _model
                                                            .fullVehicleImageUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                      ),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: valueOrDefault<String>(
                                                  _model.fullVehicleImageUrl,
                                                  'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                ),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    getCORSProxyUrl(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .fullVehicleImageUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                      ),
                                                    ),
                                                    width: 250.0,
                                                    height: 250.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 50.0,
                                                buttonSize: 35.0,
                                                fillColor: Color(0x98000000),
                                                icon: Icon(
                                                  Icons.close_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            FlutterFlowTheme.of(context).error,
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
                                          final selectedMedia =
                                              await selectMedia(
                                            imageQuality: 30,
                                            multiImage: false,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() => _model
                                                    .isDataUploading_circleImageUploadAction =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();
                                            } finally {
                                              _model.isDataUploading_circleImageUploadAction =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_circleImageUploadAction =
                                                    selectedUploadedFiles.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (!((_model.uploadedLocalFile_circleImageUploadAction
                                                      .bytes?.isNotEmpty ??
                                                  false))) {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          _model.circleImageUrlOutput =
                                              await actions
                                                  .uploadFileFirebaseStorage(
                                            'TopupM',
                                            _model
                                                .uploadedLocalFile_circleImageUploadAction,
                                            'ญฟC670301001NE54X',
                                            '128854d638b67b69b01bc66f7e61de0aecde76706d0e9e4261c704197a0ccf01',
                                          );
                                          _shouldSetState = true;
                                          _model.circleImageUrl =
                                              functions.stringToImgPath(
                                                  _model.circleImageUrlOutput)!;
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFE8F3FB),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Noto San Thai',
                                                    color: Color(0xFF1D71B8),
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
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: Image.network(
                                                        getCORSProxyUrl(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .circleImageUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                          ),
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                      allowRotation: false,
                                                      tag: valueOrDefault<
                                                          String>(
                                                        _model.circleImageUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                      ),
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: valueOrDefault<String>(
                                                  _model.circleImageUrl,
                                                  'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                ),
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    getCORSProxyUrl(
                                                      valueOrDefault<String>(
                                                        _model.circleImageUrl,
                                                        'https://firebasestorage.googleapis.com/v0/b/sawad-new-ibs.appspot.com/o/No_image_available.png?alt=media&token=15ea426e-3ea2-4b15-8f1b-947dc2daef37',
                                                      ),
                                                    ),
                                                    width: 250.0,
                                                    height: 250.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: FlutterFlowIconButton(
                                                borderRadius: 50.0,
                                                buttonSize: 35.0,
                                                fillColor: Color(0x98000000),
                                                icon: Icon(
                                                  Icons.close_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  _model.circleImageUrl = 'url';
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
                      Divider(
                        thickness: 2.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: ((_model.fullVehicleImageUrl == 'url') ||
                                  (_model.circleImageUrl == 'url'))
                              ? null
                              : () async {
                                  var _shouldSetState = false;
                                  if (_model.fullVehicleImageUrl == 'url') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('ไม่อัพรูปเต็มคัน'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  if (_model.circleImageUrl == 'url') {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          content: Text('ไม่อัพรูปป้ายวงกลม'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  await Future.wait([
                                    Future(() async {
                                      _model.fullVehicleImageBase64 =
                                          await actions.encodeBase64FromFFFile(
                                        _model
                                            .uploadedLocalFile_fullVehicleImageUploadAction,
                                      );
                                      _shouldSetState = true;
                                    }),
                                    Future(() async {
                                      _model.circleImageBase64 =
                                          await actions.encodeBase64FromFFFile(
                                        _model
                                            .uploadedLocalFile_circleImageUploadAction,
                                      );
                                      _shouldSetState = true;
                                    }),
                                  ]);
                                  FFAppState().updateSaveTopupDataStruct(
                                    (e) => e
                                      ..propertyImage =
                                          _model.fullVehicleImageBase64
                                      ..actImage = _model.circleImageBase64,
                                  );
                                  safeSetState(() {});

                                  context.pushNamed(
                                    CustomerDataPageWidget.routeName,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );

                                  if (_shouldSetState) safeSetState(() {});
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
                    ].addToEnd(SizedBox(height: 50.0)),
                  ),
                ),
              ].addToStart(SizedBox(height: 8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
