// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:screenshot/screenshot.dart';
// import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
// import 'dart:typed_data';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:barcode_widget/barcode_widget.dart';
// import '/flutter_flow/custom_functions.dart' as functions;
// import 'package:permission_handler/permission_handler.dart';

Future<String> capQrCode(BuildContext context, String? suffix, String? ref1,
    String? ref2, String? amount, String? taxId, bool? isShow) async {
  // if ([suffix, ref1, ref2, amount, taxId].any((e) => e == null || e.isEmpty)) {
  //   return 'ข้อมูลไม่ครบ กรุณาตรวจสอบอีกครั้ง';
  // }

  // var status = await Permission.storage.request();
  // if (!status.isGranted) {
  //   return 'ไม่สามารถเข้าถึง storage ได้ กรุณาให้สิทธิ์';
  // }

  // try {
  //   ScreenshotController screenshotController = ScreenshotController();
  //   final capturedImage = await screenshotController.captureFromWidget(
  //     Container(
  //       color: Colors.white,
  //       child: Padding(
  //         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
  //         child: Container(
  //           margin: EdgeInsetsDirectional.only(top: 50, start: 12, end: 12),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.max,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Text('คิวอาร์โค้ด',
  //                   style: FlutterFlowTheme.of(context).bodyMedium),
  //               Container(
  //                 width: MediaQuery.sizeOf(context).width * 0.7,
  //                 height: 230,
  //                 child: BarcodeWidget(
  //                   data: functions.genQRCodePayment(
  //                       suffix!, ref1!, ref2!, amount!, taxId!)!,
  //                   barcode: Barcode.qrCode(),
  //                   width: 300,
  //                   height: 90,
  //                   color: FlutterFlowTheme.of(context).primaryText,
  //                   backgroundColor: Colors.transparent,
  //                   drawText: false,
  //                 ),
  //               ),
  //               Text('฿ ${functions.returnNumberWithCommaFullNumber(amount!)}',
  //                   style: FlutterFlowTheme.of(context).bodyMedium.override(
  //                         fontWeight: FontWeight.bold,
  //                       )),
  //               Text('R1: $ref1'),
  //               Text('R2: $ref2'),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 10),
  //                 child: AutoSizeText(
  //                   'คุณสามารถสแกนชำระค่าเบี้ยประกันผ่านโมบายแบงค์กิ้งของทุกธนาคาร',
  //                   textAlign: TextAlign.center,
  //                   maxLines: 2,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     delay: const Duration(seconds: 1),
  //   );

  //   final currentDateTime = DateTime.now();
  //   final result = await ImageGallerySaverPlus.saveImage(
  //     Uint8List.fromList(capturedImage),
  //     quality: 100,
  //     name: "qr_code_${currentDateTime.millisecondsSinceEpoch}",
  //   );

  //   if (result['isSuccess'] == true) {
  //     return 'บันทึกภาพ QR Code ลง Gallery สำเร็จ';
  //   } else {
  //     return 'เกิดข้อผิดพลาดในการบันทึกภาพ';
  //   }
  // } catch (e) {
  //   return 'เกิดข้อผิดพลาด: ${e.toString()}';
  // }
  return '';
}
