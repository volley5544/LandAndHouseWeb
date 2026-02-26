// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:screenshot/screenshot.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:cross_file/cross_file.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
// import 'package:saver_gallery/saver_gallery.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart'; // Clipboard
import 'package:screenshot/screenshot.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cross_file/cross_file.dart';
import 'dart:convert'; // for base64

Future<void> saveImageRefer(
  BuildContext context,
  String? urlLinkAgent,
) async {
  try {
    ScreenshotController screenshotController = ScreenshotController();
    await screenshotController
        .captureFromWidget(
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 550.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).secondary,
                      Color(0xFFF8C394)
                    ],
                    stops: [0.25, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 12.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/logo_tran.png',
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: BarcodeWidget(
                          data: '${urlLinkAgent!}',
                          barcode: Barcode.qrCode(),
                          width: 200.0,
                          height: 200.0,
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          errorBuilder: (_context, _error) => SizedBox(
                            width: 200.0,
                            height: 200.0,
                          ),
                          drawText: false,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.person_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    '${FFAppState().agentProfileDataType.agentNameTh}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.dehaze_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    'รหัสอ้างอิง : ${FFAppState().agentProfileDataType.agentCode}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 28.0,
                                    height: 28.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.phone_in_talk_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    '1652',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto San Thai',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
            ),
            delay: const Duration(seconds: 1))
        .then((capImage) async {
      await screenshotController
          .captureFromWidget(
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 550.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).secondary,
                        Color(0xFFF8C394)
                      ],
                      stops: [0.25, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 12.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/logo_tran.png',
                                height: 80.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250.0,
                        height: 250.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: BarcodeWidget(
                            data: '${urlLinkAgent!}',
                            barcode: Barcode.qrCode(),
                            width: 200.0,
                            height: 200.0,
                            color: Colors.black,
                            backgroundColor: Colors.transparent,
                            errorBuilder: (_context, _error) => SizedBox(
                              width: 200.0,
                              height: 200.0,
                            ),
                            drawText: false,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 28.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.person_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      '${FFAppState().agentProfileDataType.agentNameTh}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 28.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.dehaze_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      'รหัสอ้างอิง : ${FFAppState().agentProfileDataType.agentCode}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 28.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.phone_in_talk_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                    Text(
                                      '1652',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 30.0)),
                  ),
                ),
              ),
              delay: const Duration(seconds: 1))
          .then((capImage2) async {
        DateTime currentDateTime = DateTime.now();
        await WebImageDownloader.downloadImageFromUInt8List(
            uInt8List: Uint8List.fromList(capImage2),
            imageQuality: 100,
            imageType: ImageType.jpeg,
            name: 'QR-img_${currentDateTime}.jpg');

        print('Thank you for sharing the picture!');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Thank you for sharing the picture!}',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
          ),
        );

        // final params = ShareParams(
        //   text: "Here’s your QR Code!",
        //   files: [xfile],
        // );

        // final result = await SharePlus.instance.share(params);
        // if (result.status == ShareResultStatus.success) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("Thank you for sharing the QR code!")),
        //   );
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("Sharing canceled or failed.")),
        //   );
        // }
      });
    });
  } catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'wo5544w ${e.toString()}',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).secondary,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
      ),
    );
  }
}

String? genQRCodePayment(
  String? urlLink,
) {
  return urlLink;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
