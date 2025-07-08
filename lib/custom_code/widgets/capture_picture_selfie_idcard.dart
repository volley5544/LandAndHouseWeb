// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CapturePictureSelfieIdcard extends StatefulWidget {
  const CapturePictureSelfieIdcard({
    Key? key,
    this.width,
    this.height,
    this.imagesType,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imagesType;

  @override
  _CapturePictureSelfieIdcardState createState() =>
      _CapturePictureSelfieIdcardState();
}

class _CapturePictureSelfieIdcardState
    extends State<CapturePictureSelfieIdcard> {
  bool _isLoading = true;
  bool _isFrontCamera = true;
  late CameraController _cameraController;
  XFile? _capturedImage;
  Image? imageNew;

  @override
  void initState() {
    super.initState();
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
            ? CameraLensDirection.front
            : CameraLensDirection.back));
    _cameraController = CameraController(camera, ResolutionPreset.medium);
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

  Future<void> _takePicture() async {
    if (!_cameraController.value.isInitialized) return;
    final image = await _cameraController.takePicture();
    setState(() {
      imageNew = Image.network(
        image.path,
        fit: BoxFit.fill,
        alignment: Alignment(MediaQuery.of(context).size.width / 2, 0),
      ); //
      // _capturedImage = image;
    });
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
                    ]))),
          if (imageNew != null)
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
              child: imageNew!,
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
                _capturedImage == null
                    ? FloatingActionButton(
                        heroTag: "capture",
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.camera_alt),
                        onPressed: () async {
                          await _takePicture;
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
                                  _capturedImage = null;
                                });
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
                                if (widget.imagesType! == 'idCardPlusSelfie') {
                                  setState(() {
                                    FFAppState().idCardPlusSelfieFilePath =
                                        _capturedImage!.path;
                                  });
                                  // print(
                                  // 'AppState().idCardPlusSelfieFile : ${AppState().idCardPlusSelfieFile!.path}');
                                } else {
                                  setState(() {
                                    FFAppState().idCardFilePath =
                                        _capturedImage!.path;
                                  });
                                  // print(
                                  //     'AppState().idCardFile : ${AppState().idCardFile!.path}');
                                }
                                print(_capturedImage!.path);
                                Navigator.of(context).pop();
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
