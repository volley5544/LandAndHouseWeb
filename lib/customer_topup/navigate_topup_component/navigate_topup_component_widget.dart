import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'navigate_topup_component_model.dart';
export 'navigate_topup_component_model.dart';

class NavigateTopupComponentWidget extends StatefulWidget {
  const NavigateTopupComponentWidget({
    super.key,
    required this.navigateTopupDetailAction,
    required this.contNo,
  });

  final Future Function()? navigateTopupDetailAction;
  final String? contNo;

  @override
  State<NavigateTopupComponentWidget> createState() =>
      _NavigateTopupComponentWidgetState();
}

class _NavigateTopupComponentWidgetState
    extends State<NavigateTopupComponentWidget> {
  late NavigateTopupComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigateTopupComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(('${widget.contNo}' != 'null') && ('${widget.contNo}' != ''))) {
        return;
      }
      await widget.navigateTopupDetailAction?.call();
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
        children: <Widget>[].divide(SizedBox(width: 8.0)),
      ),
    );
  }
}
