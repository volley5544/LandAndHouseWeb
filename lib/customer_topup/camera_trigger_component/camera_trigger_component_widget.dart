import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/loading/loading_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'camera_trigger_component_model.dart';
export 'camera_trigger_component_model.dart';

class CameraTriggerComponentWidget extends StatefulWidget {
  const CameraTriggerComponentWidget({super.key});

  @override
  State<CameraTriggerComponentWidget> createState() =>
      _CameraTriggerComponentWidgetState();
}

class _CameraTriggerComponentWidgetState
    extends State<CameraTriggerComponentWidget> {
  late CameraTriggerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraTriggerComponentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final selectedMedia = await selectMedia(
        imageQuality: 30,
        multiImage: false,
      );
      if (selectedMedia != null &&
          selectedMedia
              .every((m) => validateFileFormat(m.storagePath, context))) {
        safeSetState(
            () => _model.isDataUploading_idCardImageUploadActionAuto = true);
        var selectedUploadedFiles = <FFUploadedFile>[];

        try {
          selectedUploadedFiles = selectedMedia
              .map((m) => FFUploadedFile(
                    name: m.storagePath.split('/').last,
                    bytes: m.bytes,
                    height: m.dimensions?.height,
                    width: m.dimensions?.width,
                    blurHash: m.blurHash,
                    originalFilename: m.originalFilename,
                  ))
              .toList();
        } finally {
          _model.isDataUploading_idCardImageUploadActionAuto = false;
        }
        if (selectedUploadedFiles.length == selectedMedia.length) {
          safeSetState(() {
            _model.uploadedLocalFile_idCardImageUploadActionAuto =
                selectedUploadedFiles.first;
          });
        } else {
          safeSetState(() {});
          return;
        }
      }

      if (!((_model.uploadedLocalFile_idCardImageUploadActionAuto.bytes
                  ?.isNotEmpty ??
              false))) {
        Navigator.pop(context, null);
        return;
      }
      _model.idCardImageUrlOutput = await actions.uploadFileFirebaseStorage(
        FFAppState().getLoanListSelected.loanTypeCode == 'M'
            ? 'TopupM'
            : 'TopupC',
        _model.uploadedLocalFile_idCardImageUploadActionAuto,
        FFAppState().getLoanListSelected.contractNo,
        FFAppState().customerDetailData.hashThaiId,
      );
      Navigator.pop(
          context, _model.uploadedLocalFile_idCardImageUploadActionAuto);
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
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: wrapWithModel(
        model: _model.loadingModel,
        updateCallback: () => safeSetState(() {}),
        child: LoadingWidget(),
      ),
    );
  }
}
