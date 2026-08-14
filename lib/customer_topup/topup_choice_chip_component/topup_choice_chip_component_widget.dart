import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'topup_choice_chip_component_model.dart';
export 'topup_choice_chip_component_model.dart';

class TopupChoiceChipComponentWidget extends StatefulWidget {
  const TopupChoiceChipComponentWidget({
    super.key,
    required this.initialTab,
    this.updateTabSelected,
  });

  final int? initialTab;
  final Future Function(int tabSelected)? updateTabSelected;

  @override
  State<TopupChoiceChipComponentWidget> createState() =>
      _TopupChoiceChipComponentWidgetState();
}

class _TopupChoiceChipComponentWidgetState
    extends State<TopupChoiceChipComponentWidget> {
  late TopupChoiceChipComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupChoiceChipComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.tabSelected = widget.initialTab;
      safeSetState(() {});
      await widget.updateTabSelected?.call(
        _model.tabSelected!,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.tabSelected = 1;
                safeSetState(() {});
                await widget.updateTabSelected?.call(
                  _model.tabSelected!,
                );
              },
              child: Container(
                width: 100.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: _model.tabSelected == 1
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'สัญญาที่เพิ่มวงเงินได้',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: _model.tabSelected == 1
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.tabSelected = 2;
                safeSetState(() {});
                await widget.updateTabSelected?.call(
                  _model.tabSelected!,
                );
              },
              child: Container(
                width: 100.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: _model.tabSelected != 1
                      ? FlutterFlowTheme.of(context).primaryText
                      : FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'สัญญาที่ยังไม่เข้าเงื่อนไข',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto San Thai',
                          color: _model.tabSelected != 1
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(width: 8.0)),
      ),
    );
  }
}
