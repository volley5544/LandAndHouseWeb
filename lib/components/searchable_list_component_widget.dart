import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'searchable_list_component_model.dart';
export 'searchable_list_component_model.dart';

class SearchableListComponentWidget extends StatefulWidget {
  const SearchableListComponentWidget({
    super.key,
    required this.title,
    required this.searchHintText,
    required this.listData,
    required this.executeAction,
  });

  final String? title;
  final String? searchHintText;
  final List<String>? listData;
  final Future Function(int index)? executeAction;

  @override
  State<SearchableListComponentWidget> createState() =>
      _SearchableListComponentWidgetState();
}

class _SearchableListComponentWidgetState
    extends State<SearchableListComponentWidget> {
  late SearchableListComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchableListComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.searchingDataList = widget.listData!.toList().cast<String>();
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 2.0,
            child: Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width * 0.1,
                                0.0,
                              ),
                              0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.title,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Noto San Thai',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 100),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: widget.searchHintText,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Noto San Thai',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search_outlined,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto San Thai',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.textController.text.length > 2) {
                              _model.searchingDataList = widget.listData!
                                  .where((e) => functions.containString(
                                      _model.textController.text, e)!)
                                  .toList()
                                  .cast<String>();
                              safeSetState(() {});
                            }
                          },
                          text: 'ค้นหา',
                          options: FFButtonOptions(
                            width: 100.0,
                            height: 50.0,
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
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (true) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final dataList =
                                    _model.searchingDataList.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: dataList.length,
                                  itemBuilder: (context, dataListIndex) {
                                    final dataListItem =
                                        dataList[dataListIndex];
                                    return Visibility(
                                      visible: true ||
                                          functions.containString(
                                              _model.textController.text,
                                              FFAppState()
                                                  .addressDataOriginal
                                                  .elementAtOrNull(
                                                      dataListIndex)
                                                  ?.keyword)!,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await widget.executeAction?.call(
                                                functions.findIndexInList(
                                                    widget.listData?.toList(),
                                                    dataListItem)!,
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dataListItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansThai(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    'กรุณากรอกคำค้นหาอย่างน้อย 3 ตัวอักษร',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: Color(0xCC646464),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 200.0)),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ]
                    .divide(SizedBox(height: 12.0))
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
