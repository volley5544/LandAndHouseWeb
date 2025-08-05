import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'capture_picture_selfie_idcard_page_model.dart';
export 'capture_picture_selfie_idcard_page_model.dart';

class CapturePictureSelfieIdcardPageWidget extends StatefulWidget {
  const CapturePictureSelfieIdcardPageWidget({
    super.key,
    required this.imageType,
    required this.title,
  });

  final String? imageType;
  final String? title;

  static String routeName = 'CapturePictureSelfieIdcardPage';
  static String routePath = '/capturePictureSelfieIdcardPage';

  @override
  State<CapturePictureSelfieIdcardPageWidget> createState() =>
      _CapturePictureSelfieIdcardPageWidgetState();
}

class _CapturePictureSelfieIdcardPageWidgetState
    extends State<CapturePictureSelfieIdcardPageWidget> {
  late CapturePictureSelfieIdcardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CapturePictureSelfieIdcardPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              valueOrDefault<String>(
                widget.title,
                'title',
              ),
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: custom_widgets.CapturePictureSelfieIdcard(
                width: double.infinity,
                height: double.infinity,
                imagesType: widget.imageType,
                onFinishCapture: (imgFileBytes) async {},
                onCaptured: (isCaptured) async {},
                openLoadingComponent: () async {},
                closeLoadingComponent: () async {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
