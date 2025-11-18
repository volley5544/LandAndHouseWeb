import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'my_commission_advance_search_component_model.dart';
export 'my_commission_advance_search_component_model.dart';

class MyCommissionAdvanceSearchComponentWidget extends StatefulWidget {
  const MyCommissionAdvanceSearchComponentWidget({
    super.key,
    required this.showingLeadData,
  });

  final List<AgentCommissionLeadDataModelStruct>? showingLeadData;

  @override
  State<MyCommissionAdvanceSearchComponentWidget> createState() =>
      _MyCommissionAdvanceSearchComponentWidgetState();
}

class _MyCommissionAdvanceSearchComponentWidgetState
    extends State<MyCommissionAdvanceSearchComponentWidget> {
  late MyCommissionAdvanceSearchComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => MyCommissionAdvanceSearchComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.featured_play_list_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Text(
                              'ค้นหาแบบละเอียด',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ผลิตภัณฑ์',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.productDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.productDropDownValue ??= '',
                              ),
                              options: List<String>.from(functions
                                  .createUniqueValueList(widget.showingLeadData
                                      ?.map((e) => e.product)
                                      .toList()
                                      .toList())!),
                              optionLabels:
                                  functions.createUniqueValueListLabel(functions
                                      .createUniqueValueList(widget
                                          .showingLeadData
                                          ?.map((e) => e.product)
                                          .toList()
                                          .toList())
                                      ?.toList())!,
                              onChanged: (val) => safeSetState(
                                  () => _model.productDropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xFF646464),
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'ระบุผลิตภัณฑ์',
                              searchHintText: 'ผลิตภัณฑ์...',
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ประเภทสินทรัพย์',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.loanTypeNameDropDownValueController ??=
                                      FormFieldController<String>(
                                _model.loanTypeNameDropDownValue ??= '',
                              ),
                              options: List<String>.from(functions
                                  .createUniqueValueList(widget.showingLeadData
                                      ?.map((e) => e.loanTypeName)
                                      .toList()
                                      .toList())!),
                              optionLabels:
                                  functions.createUniqueValueListLabel(functions
                                      .createUniqueValueList(widget
                                          .showingLeadData
                                          ?.map((e) => e.loanTypeName)
                                          .toList()
                                          .toList())
                                      ?.toList())!,
                              onChanged: (val) => safeSetState(
                                  () => _model.loanTypeNameDropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xFF646464),
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'ระบุประเภทสินทรัพย์',
                              searchHintText: 'ประเภทสินทรัพย์...',
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'วิธีการรับเงิน',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown<String>(
                              controller: _model
                                      .paymentMethodDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.paymentMethodDropDownValue ??= '',
                              ),
                              options: List<String>.from(functions
                                  .createUniqueValueList(widget.showingLeadData
                                      ?.map((e) => e.paymentMethod)
                                      .toList()
                                      .toList())!),
                              optionLabels:
                                  functions.createUniqueValueListLabel(functions
                                      .createUniqueValueList(widget
                                          .showingLeadData
                                          ?.map((e) => e.paymentMethod)
                                          .toList()
                                          .toList())
                                      ?.toList())!,
                              onChanged: (val) => safeSetState(() =>
                                  _model.paymentMethodDropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xFF646464),
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'ระบุวิธีการรับเงิน',
                              searchHintText: 'วิธีการรับเงิน...',
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ช่องทางการรับเงิน',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Noto San Thai',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FlutterFlowDropDown<String>(
                              controller: _model
                                      .paymentChannelDropDownValueController ??=
                                  FormFieldController<String>(
                                _model.paymentChannelDropDownValue ??= '',
                              ),
                              options: List<String>.from(functions
                                  .createUniqueValueList(widget.showingLeadData
                                      ?.map((e) => e.paymentChannel)
                                      .toList()
                                      .toList())!),
                              optionLabels:
                                  functions.createUniqueValueListLabel(functions
                                      .createUniqueValueList(widget
                                          .showingLeadData
                                          ?.map((e) => e.paymentChannel)
                                          .toList()
                                          .toList())
                                      ?.toList())!,
                              onChanged: (val) => safeSetState(() =>
                                  _model.paymentChannelDropDownValue = val),
                              width: 200.0,
                              height: 40.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    letterSpacing: 0.0,
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto San Thai',
                                    color: Color(0xFF646464),
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'ระบุช่องทางการรับเงิน',
                              searchHintText: 'ช่องทางการรับเงิน...',
                              icon: Icon(
                                Icons.navigate_next_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 30.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              isOverButton: false,
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context, <String, dynamic>{
                    'product': _model.productDropDownValue != null &&
                            _model.productDropDownValue != ''
                        ? _model.productDropDownValue
                        : '${''}',
                    'loanTypeName': _model.loanTypeNameDropDownValue != null &&
                            _model.loanTypeNameDropDownValue != ''
                        ? _model.loanTypeNameDropDownValue
                        : '${''}',
                    'paymentMethod':
                        _model.paymentMethodDropDownValue != null &&
                                _model.paymentMethodDropDownValue != ''
                            ? _model.paymentMethodDropDownValue
                            : '${''}',
                    'paymentChannel':
                        _model.paymentChannelDropDownValue != null &&
                                _model.paymentChannelDropDownValue != ''
                            ? _model.paymentChannelDropDownValue
                            : '${''}',
                  });
                },
                text: 'ค้นหา',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Noto San Thai',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ].addToStart(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 30.0)),
        ),
      ),
    );
  }
}
