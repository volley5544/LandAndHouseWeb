import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'image_source_component_model.dart';
export 'image_source_component_model.dart';

class ImageSourceComponentWidget extends StatefulWidget {
  const ImageSourceComponentWidget({
    super.key,
    String? cameraType,
    this.actionName,
  }) : this.cameraType = cameraType ?? 'normal';

  final String cameraType;
  final String? actionName;

  @override
  State<ImageSourceComponentWidget> createState() =>
      _ImageSourceComponentWidgetState();
}

class _ImageSourceComponentWidgetState
    extends State<ImageSourceComponentWidget> {
  late ImageSourceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageSourceComponentModel());

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
      width: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          maxWidth: 1920.00,
                          maxHeight: 1920.00,
                          imageQuality: 50,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          safeSetState(() =>
                              _model.isDataUploading_uploadDataBluebook = true);
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
                            _model.isDataUploading_uploadDataBluebook = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile_uploadDataBluebook =
                                  selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }
                        }

                        if ((_model.uploadedLocalFile_uploadDataBluebook.bytes
                                    ?.isNotEmpty ??
                                false)) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'อัพโหลดรูปภาพสำเร็จ!',
                                style: TextStyle(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              duration: Duration(milliseconds: 3000),
                              backgroundColor: Color(0xBE000000),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'อัพโหลดรูปภาพไม่สำเร็จ กรุณาลองใหม่อีกครั้ง',
                                style: TextStyle(
                                  fontFamily: 'Noto San Thai',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              duration: Duration(milliseconds: 3000),
                              backgroundColor: Color(0xBE000000),
                            ),
                          );
                          return;
                        }

                        Navigator.pop(context,
                            _model.uploadedLocalFile_uploadDataBluebook);
                      },
                      text: 'รูปภาพ',
                      icon: Icon(
                        Icons.image_outlined,
                        size: 30.0,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 70.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (FFAppState().platform == 'mobile') {
                          await actions.openCameraWebview(
                            widget.cameraType,
                            widget.actionName,
                          );
                          Navigator.pop(context);
                        } else {
                          final selectedMedia = await selectMedia(
                            maxWidth: 1920.00,
                            maxHeight: 1920.00,
                            imageQuality: 50,
                            multiImage: false,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            safeSetState(() => _model
                                    .isDataUploading_uploadDataBluebookCamera =
                                true);
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
                              _model.isDataUploading_uploadDataBluebookCamera =
                                  false;
                            }
                            if (selectedUploadedFiles.length ==
                                selectedMedia.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadDataBluebookCamera =
                                    selectedUploadedFiles.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          Navigator.pop(
                              context,
                              _model
                                  .uploadedLocalFile_uploadDataBluebookCamera);
                        }
                      },
                      text: 'กล้องถ่ายรูป',
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 30.0,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 35.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Noto San Thai',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
