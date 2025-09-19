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

Future<void> shareImage(
  BuildContext context,
  String? urlLinkAgent,
) async {
  try {
    ScreenshotController screenshotController = ScreenshotController();
    await screenshotController
        .captureFromWidget(
            Container(
              margin: EdgeInsetsDirectional.only(top: 50),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.7, //isQrCodeSelected :MediaQuery.of(context).size.width * 0.9,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: BarcodeWidget(
                        data: genQRCodePayment(urlLinkAgent!)!,
                        barcode: Barcode.qrCode(),
                        width: 300,
                        height: 90,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        drawText: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            delay: const Duration(seconds: 1))
        .then((capImage) async {
      await screenshotController
          .captureFromWidget(
              Container(
                margin: EdgeInsetsDirectional.only(top: 50),
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.7, //isQrCodeSelected :MediaQuery.of(context).size.width * 0.9,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: BarcodeWidget(
                          data: genQRCodePayment(urlLinkAgent!)!,
                          barcode: Barcode.qrCode(),
                          width: 300,
                          height: 90,
                          backgroundColor: Colors.white,
                          color: Colors.black,
                          drawText: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              delay: const Duration(seconds: 1))
          .then((capImage2) async {
        DateTime currentDateTime = DateTime.now();
        final xfile = XFile.fromData(
          capImage2,
          mimeType: 'image/png',
          name: 'qr_code.png',
        );
        final bytes = await xfile.readAsBytes();

        // Convert to base64
        final base64String = base64Encode(bytes);

        print("ShareImageInAppVolley5544${base64String}");

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
    // print("Error sharing QR image: $e");
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("Error sharing QR image")),
    // );
  }
}

String? genQRCodePayment(
  String? urlLink,
) {
  return urlLink;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
