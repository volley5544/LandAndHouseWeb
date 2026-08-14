// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
// import 'package:webviewx_plus/webviewx_plus.dart';
import 'package:web/web.dart' as web;
import 'dart:typed_data';

class CapturePictureSelfieIdcard extends StatefulWidget {
  const CapturePictureSelfieIdcard(
      {Key? key,
      this.width,
      this.height,
      this.imagesType,
      required this.onFinishCapture,
      required this.onCaptured,
      required this.openLoadingComponent,
      required this.closeLoadingComponent})
      : super(key: key);

  final double? width;
  final double? height;
  final String? imagesType;
  final Future Function(FFUploadedFile imgFileBytes) onFinishCapture;
  final Future Function(bool isCaptured) onCaptured;
  final Future Function() openLoadingComponent;
  final Future Function() closeLoadingComponent;

  @override
  _CapturePictureSelfieIdcardState createState() =>
      _CapturePictureSelfieIdcardState();
}

class _CapturePictureSelfieIdcardState
    extends State<CapturePictureSelfieIdcard> {
  bool _isLoading = true;
  bool _isFrontCamera = true;
  late CameraController _cameraController;
  String _capturePicPath = '';
  XFile? _capturedImage = null;
  Image? imageNew;

  @override
  void initState() {
    super.initState();
    setState(() {
      _capturePicPath = '';
    });
    _initCamera();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.firstWhere((cam) =>
        cam.lensDirection ==
        (widget.imagesType != 'idCard'
            ? (widget.imagesType != 'test5544'
                ? CameraLensDirection.front
                : CameraLensDirection.back)
            : CameraLensDirection.back));
    _cameraController =
        CameraController(camera, ResolutionPreset.medium, enableAudio: false);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  Future<void> _switchCameraDirection() async {
    setState(() {
      _isLoading = true;
      _isFrontCamera = !_isFrontCamera;
    });
    await _initCamera();
  }

  Future<String> _takePicture() async {
    //try {
    if (!_cameraController.value.isInitialized) return '';
    // final Image image;
    // image = Image.network(

    //   fit: BoxFit.fill,
    //   alignment: Alignment(MediaQuery.of(context).size.width / 2, 0),
    // );

    _capturedImage = await _cameraController.takePicture();

    String output = _capturedImage!.path!;
    setState(() async {
      // imageNew = Image.network(
      //   image.path,
      //   fit: BoxFit.fill,
      //   alignment: Alignment(MediaQuery.of(context).size.width / 2, 0),
      // ); //
      // _capturedImage = image;
    });
    //} catch (e) {

    // print('Exception : ${e.toString()}');

    //}
    return '${output}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          if (!_isLoading)
            Positioned.fill(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: double.infinity,
                        child: CameraPreview(_cameraController),
                      ),
                      Visibility(
                        visible: widget.imagesType == 'idCardPlusSelfie',
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: HolePainter(
                            topCircleRect: Rect.fromCenter(
                              center: Offset(
                                  MediaQuery.sizeOf(context).width / 2,
                                  (MediaQuery.sizeOf(context).height * 0.32) *
                                      0.75),
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).height * 0.3,
                            ),
                            bottomRect: Rect.fromCenter(
                              center: Offset(
                                  MediaQuery.sizeOf(context).width / 2,
                                  (MediaQuery.sizeOf(context).height * 0.8) *
                                      0.75),
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              height: MediaQuery.sizeOf(context).height * 0.2,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.imagesType == 'idCardPlusSelfie',
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.75,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -0.6),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.6,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100.0),
                                      bottomRight: Radius.circular(100.0),
                                      topLeft: Radius.circular(100.0),
                                      topRight: Radius.circular(100.0),
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.8),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.imagesType == 'idCard',
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: HolePainterIdCard(
                            topCircleRect: Rect.fromCenter(
                              center: Offset(
                                  MediaQuery.sizeOf(context).width / 2,
                                  (MediaQuery.sizeOf(context).height / 2) *
                                      0.75),
                              width: MediaQuery.sizeOf(context).width * 0.98,
                              height: MediaQuery.sizeOf(context).height * 0.3,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.imagesType == 'idCard',
                        child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.75,
                            decoration: BoxDecoration(),
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.98,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 7.0,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 12.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.15,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.15,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 5.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 12.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.25,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.13,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.white,
                                                        width: 5.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))),
                      ),

                      // Visibility(
                      //   visible: widget.imagesType == 'idCard',
                      //   child: CustomPaint(
                      //     size: Size.infinite,
                      //     painter: HolePainterIdCard(
                      //       topCircleRect: Rect.fromCenter(
                      //         center: Offset(
                      //             MediaQuery.sizeOf(context).width / 2,
                      //             (MediaQuery.sizeOf(context).height / 2) *
                      //                 0.75),
                      //         width: MediaQuery.sizeOf(context).width * 0.98,
                      //         height: MediaQuery.sizeOf(context).height * 0.35,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Visibility(
                      //   visible: widget.imagesType == 'idCard',
                      //   child: Container(
                      //       width: double.infinity,
                      //       height: MediaQuery.of(context).size.height * 0.75,
                      //       decoration: BoxDecoration(),
                      //       child: Container(
                      //           width: double.infinity,
                      //           height: double.infinity,
                      //           child: Container(
                      //             width: double.infinity,
                      //             height: double.infinity,
                      //             child: Stack(
                      //               children: [
                      //                 Align(
                      //                   alignment:
                      //                       AlignmentDirectional(0.0, 0.0),
                      //                   child: Container(
                      //                       width: MediaQuery.sizeOf(context)
                      //                               .width *
                      //                           0.98,
                      //                       height: MediaQuery.sizeOf(context)
                      //                               .height *
                      //                           0.35,
                      //                       decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                           color: Colors.white,
                      //                           width: 4.0,
                      //                         ),
                      //                       ),
                      //                       child: Container(
                      //                           width: double.infinity,
                      //                           height: double.infinity,
                      //                           child: Container(
                      //                               width: double.infinity,
                      //                               height: double.infinity,
                      //                               child: Container(
                      //                                   width: double.infinity,
                      //                                   height: double.infinity,
                      //                                   child: Container(
                      //                                       width:
                      //                                           double.infinity,
                      //                                       height:
                      //                                           double.infinity,
                      //                                       child: Container(
                      //                                         width: double
                      //                                             .infinity,
                      //                                         height: double
                      //                                             .infinity,
                      //                                         child: Stack(
                      //                                           children: [
                      //                                             Align(
                      //                                               alignment:
                      //                                                   AlignmentDirectional(
                      //                                                       0.4,
                      //                                                       -0.9),
                      //                                               child:
                      //                                                   Container(
                      //                                                 width: MediaQuery.sizeOf(context)
                      //                                                         .width *
                      //                                                     0.37,
                      //                                                 height:
                      //                                                     30.0,
                      //                                                 decoration:
                      //                                                     BoxDecoration(
                      //                                                   border:
                      //                                                       Border.all(
                      //                                                     color:
                      //                                                         FlutterFlowTheme.of(context).secondary,
                      //                                                     width:
                      //                                                         2.0,
                      //                                                   ),
                      //                                                 ),
                      //                                               ),
                      //                                             ),
                      //                                             Align(
                      //                                               alignment:
                      //                                                   AlignmentDirectional(
                      //                                                       0.3,
                      //                                                       -1.3),
                      //                                               child: Text(
                      //                                                 'เลขที่บัตรประชาชน',
                      //                                                 style: FlutterFlowTheme.of(
                      //                                                         context)
                      //                                                     .bodyMedium
                      //                                                     .override(
                      //                                                       fontFamily:
                      //                                                           'Noto San Thai',
                      //                                                       color:
                      //                                                           FlutterFlowTheme.of(context).secondary,
                      //                                                       letterSpacing:
                      //                                                           0.0,
                      //                                                     ),
                      //                                               ),
                      //                                             ),
                      //                                             Align(
                      //                                               alignment:
                      //                                                   AlignmentDirectional(
                      //                                                       0.38,
                      //                                                       1.0),
                      //                                               child:
                      //                                                   Container(
                      //                                                 width: MediaQuery.sizeOf(context)
                      //                                                         .width *
                      //                                                     0.18,
                      //                                                 height: MediaQuery.sizeOf(context)
                      //                                                         .height *
                      //                                                     0.08,
                      //                                                 decoration:
                      //                                                     BoxDecoration(
                      //                                                   border:
                      //                                                       Border.all(
                      //                                                     color:
                      //                                                         FlutterFlowTheme.of(context).secondary,
                      //                                                     width:
                      //                                                         2.0,
                      //                                                   ),
                      //                                                 ),
                      //                                               ),
                      //                                             ),
                      //                                             Align(
                      //                                               alignment:
                      //                                                   AlignmentDirectional(
                      //                                                       0.4,
                      //                                                       1.3),
                      //                                               child: Text(
                      //                                                 'วันที่หมดอายุบัตร',
                      //                                                 style: FlutterFlowTheme.of(
                      //                                                         context)
                      //                                                     .bodyMedium
                      //                                                     .override(
                      //                                                       fontFamily:
                      //                                                           'Noto San Thai',
                      //                                                       color:
                      //                                                           FlutterFlowTheme.of(context).secondary,
                      //                                                       letterSpacing:
                      //                                                           0.0,
                      //                                                     ),
                      //                                               ),
                      //                                             ),
                      //                                           ],
                      //                                         ),
                      //                                       )))))),
                      //                 ),
                      //               ],
                      //             ),
                      //           ))),
                      // ),

                      Visibility(
                        visible: widget.imagesType == 'test5544',
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: HolePainterIdCard(
                            topCircleRect: Rect.fromCenter(
                              center: Offset(
                                  MediaQuery.sizeOf(context).width / 2,
                                  (MediaQuery.sizeOf(context).height / 2) *
                                      0.75),
                              width: MediaQuery.sizeOf(context).width * 0.98,
                              height: MediaQuery.sizeOf(context).height * 0.35,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.imagesType == 'test5544',
                        child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.75,
                            decoration: BoxDecoration(),
                            child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.98,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 4.0,
                                              ),
                                            ),
                                            child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              child: Stack(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.4,
                                                                            -0.9),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.37,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.3,
                                                                            -1.3),
                                                                    child: Text(
                                                                      'เลขที่บัตรประชาชน',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.38,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.18,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.4,
                                                                            1.3),
                                                                    child: Text(
                                                                      'วันที่หมดอายุบัตร',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Noto San Thai',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )))))),
                                      ),
                                    ],
                                  ),
                                ))),
                      ),
                    ]))),
          if (_capturePicPath != '')
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Image.network(
                _capturePicPath,
                fit: BoxFit.fill,
                alignment: Alignment(MediaQuery.of(context).size.width / 2, 0),
              ), //,
            ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // FloatingActionButton(
                //   heroTag: "switch",
                //   backgroundColor: Colors.grey,
                //   child: const Icon(Icons.switch_camera),
                //   onPressed: _switchCameraDirection,
                // ),
                _capturePicPath == ''
                    ? FloatingActionButton(
                        heroTag: "capture",
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.camera_alt),
                        onPressed: () async {
                          try {
                            await widget.openLoadingComponent();
                            _capturePicPath = await _takePicture();
                            await widget.closeLoadingComponent();
                            await widget.onCaptured(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${_capturedImage!.name}',
                                  style: TextStyle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'wo5544w',
                                  style: TextStyle(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            );
                          }

                          // await showDialog(
                          //   context: context,
                          //   builder: (alertDialogContext) {
                          //     return WebViewAware(
                          //       child: AlertDialog(
                          //         content: Text(
                          //             'PathFile : ${_capturedImage!.path}'),
                          //         actions: [
                          //           TextButton(
                          //             onPressed: () =>
                          //                 Navigator.pop(alertDialogContext),
                          //             child: Text('Ok'),
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                      )
                    : Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: "clear picture",
                              backgroundColor: Colors.grey,
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _capturePicPath = '';
                                  _capturedImage = null;
                                });
                                await widget.onCaptured(false);
                              },
                            ),
                            FloatingActionButton(
                              heroTag: "done",
                              backgroundColor: Colors.white,
                              child: const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              onPressed: () async {
                                // appstate that store image
                                // _capturePicPath

                                // Load blob URL to Uint8List

                                Uint8List bytes =
                                    await _capturedImage!.readAsBytes();
                                FFUploadedFile fileBytesOutput = FFUploadedFile(
                                    bytes: bytes,
                                    name:
                                        widget.imagesType! == 'idCardPlusSelfie'
                                            ? 'selfie-img.jpg'
                                            : 'id-card-img.jpg');
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     content: Text(
                                //       '${fileBytesOutput.bytes}',
                                //       style: TextStyle(
                                //         color: FlutterFlowTheme.of(context)
                                //             .secondary,
                                //       ),
                                //     ),
                                //     duration: Duration(milliseconds: 4000),
                                //     backgroundColor:
                                //         FlutterFlowTheme.of(context)
                                //             .primaryText,
                                //   ),
                                // );

                                if (widget.imagesType! == 'idCardPlusSelfie') {
                                  setState(() async {
                                    FFAppState().idCardPlusSelfieFilePath =
                                        _capturePicPath;
                                  });
                                  // print(
                                  // 'AppState().idCardPlusSelfieFile : ${AppState().idCardPlusSelfieFile!.path}');
                                } else {
                                  setState(() async {
                                    FFAppState().idCardFilePath =
                                        _capturePicPath;
                                  });
                                  // print(
                                  //     'AppState().idCardFile : ${AppState().idCardFile!.path}');
                                }
                                print(_capturePicPath);
                                await widget.onFinishCapture(fileBytesOutput);
                              },
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HolePainter extends CustomPainter {
  final Rect topCircleRect;
  final Rect bottomRect;

  HolePainter({required this.topCircleRect, required this.bottomRect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.75)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height)) // full screen
      ..addRRect(RRect.fromRectAndRadius(topCircleRect, Radius.circular(100)))
      ..addRect(bottomRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HolePainter oldDelegate) {
    return oldDelegate.topCircleRect != topCircleRect ||
        oldDelegate.bottomRect != bottomRect;
  }
}

class HolePainterIdCard extends CustomPainter {
  final Rect topCircleRect;

  HolePainterIdCard({required this.topCircleRect});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.75)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height)) // full screen
      ..addRRect(RRect.fromRectAndRadius(topCircleRect, Radius.circular(8)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant HolePainterIdCard oldDelegate) {
    return oldDelegate.topCircleRect != topCircleRect;
  }
}
