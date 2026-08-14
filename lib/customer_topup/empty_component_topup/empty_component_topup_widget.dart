import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_component_topup_model.dart';
export 'empty_component_topup_model.dart';

class EmptyComponentTopupWidget extends StatefulWidget {
  const EmptyComponentTopupWidget({
    super.key,
    this.text1,
    this.text2,
  });

  final String? text1;
  final String? text2;

  @override
  State<EmptyComponentTopupWidget> createState() =>
      _EmptyComponentTopupWidgetState();
}

class _EmptyComponentTopupWidgetState extends State<EmptyComponentTopupWidget> {
  late EmptyComponentTopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyComponentTopupModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (('${widget.text1}' != '') && ('${widget.text1}' != 'null'))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                child: Text(
                  '${widget.text1}',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Noto San Thai',
                        color: Color(0x7F646464),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            Text(
              valueOrDefault<String>(
                widget.text2,
                'text2',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Noto San Thai',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ].addToStart(SizedBox(height: 48.0)),
        ),
      ),
    );
  }
}
