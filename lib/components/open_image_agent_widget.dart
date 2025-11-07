import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'open_image_agent_model.dart';
export 'open_image_agent_model.dart';

class OpenImageAgentWidget extends StatefulWidget {
  const OpenImageAgentWidget({super.key});

  @override
  State<OpenImageAgentWidget> createState() => _OpenImageAgentWidgetState();
}

class _OpenImageAgentWidgetState extends State<OpenImageAgentWidget> {
  late OpenImageAgentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenImageAgentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Intro--291068-.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_backspace_outlined,
                color: FlutterFlowTheme.of(context).secondary,
                size: 24.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
