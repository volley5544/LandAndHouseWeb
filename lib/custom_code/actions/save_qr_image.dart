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
import 'package:image_downloader_web/image_downloader_web.dart';
// import 'package:saver_gallery/saver_gallery.dart';

Future<void> saveQrImage(
  BuildContext context,
  String? qrCodeAmount,
  String? suffix,
  String? ref1,
  String? ref2,
  String? taxId,
  String? contractNo,
  String? topupAmountWithComma,
  String? carRegist,
  String? currentDateText,
) async {
  String amountStr = '${qrCodeAmount!.toString()}0';

  try {
    print('QR suffix : ${suffix!}');
    print('555');
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
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 20),
                    //   width: MediaQuery.of(context).size.width * 0.5,
                    //   height: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //
                    //   ),
                    //   child: Center(
                    //     child: Image.asset(
                    //       'assets/srisawad-logo.png',
                    //       width: 120,
                    //       height: 140,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.7, //isQrCodeSelected :MediaQuery.of(context).size.width * 0.9,
                      height: 230,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: BarcodeWidget(
                        data: genQRCodePayment(
                          suffix!,
                          ref1!,
                          ref2!,
                          double.parse(qrCodeAmount!),
                          //paymentDetail.qrCodeDetail.amount,
                          taxId!,
                          // paymentDetail.qrCodeDetail.suffix,
                          // paymentDetail.qrCodeDetail.ref1,
                          // paymentDetail.qrCodeDetail.ref2,
                          // paymentDetail.qrCodeDetail.amount,
                          // paymentDetail.qrCodeDetail.tafghfgh
                        )!,
                        barcode: Barcode.qrCode(),
                        width: 300,
                        height: 90,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        drawText: false,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 36, right: 36, top: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'เลขที่สัญญา ',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'จำนวนเงินที่ต้องชำระ ',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 36, right: 36, top: 10, bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${contractNo}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${topupAmountWithComma}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 36, right: 36, bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'เลขทะเบียน',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'ข้อมูล ณ วันที่',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 36, right: 36, bottom: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${carRegist}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${currentDateText}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 36, right: 36, top: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              'R1: ',
                              style: TextStyle(
                                fontFamily: 'Noto Sans Thai',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              '${ref1}',
                              style: TextStyle(
                                fontFamily: 'Noto Sans Thai',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 36, right: 36),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              'R2: ',
                              style: TextStyle(
                                fontFamily: 'Noto Sans Thai',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              '${ref2}',
                              style: TextStyle(
                                fontFamily: 'Noto Sans Thai',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 12),
                      child: Divider(
                        color: HexColor(
                            '#E4E3E3'), // You can customize the color of the divider
                        thickness:
                            1, // You can adjust the thickness of the divider
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'ใช้สำหรับชำระสินเชื่อของทางศรีสวัสดิ์เท่านั้น',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Noto Sans Thai',
                          color: Colors.black,
                          fontSize: 14,
                        ),
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
                      // Container(
                      //   margin: const EdgeInsets.only(bottom: 20),
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      //   height: 50,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //
                      //   ),
                      //   child: Center(
                      //     child: Image.asset(
                      //       'assets/srisawad-logo.png',
                      //       width: 120,
                      //       height: 140,
                      //     ),
                      //   ),
                      // ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.7, //isQrCodeSelected :MediaQuery.of(context).size.width * 0.9,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: BarcodeWidget(
                          data: genQRCodePayment(
                            suffix!,
                            ref1!,
                            ref2!,
                            double.parse(qrCodeAmount!),
                            //paymentDetail.qrCodeDetail.amount,
                            taxId!,
                            // paymentDetail.qrCodeDetail.suffix,
                            // paymentDetail.qrCodeDetail.ref1,
                            // paymentDetail.qrCodeDetail.ref2,
                            // paymentDetail.qrCodeDetail.amount,
                            // paymentDetail.qrCodeDetail.tafghfgh
                          )!,
                          barcode: Barcode.qrCode(),
                          width: 300,
                          height: 90,
                          backgroundColor: Colors.white,
                          color: Colors.black,
                          drawText: false,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(left: 36, right: 36, top: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  'เลขที่สัญญา ',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  'จำนวนเงินที่ต้องชำระ ',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 36, right: 36, top: 10, bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '${contractNo}',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '${topupAmountWithComma}',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 36, right: 36, bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  'เลขทะเบียน',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  'ข้อมูล ณ วันที่',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 36, right: 36, bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '${carRegist}',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Text(
                                  '${currentDateText}',
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans Thai',
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 36, right: 36, top: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'R1: ',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${ref1}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 36, right: 36),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                'R2: ',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                '${ref2}',
                                style: TextStyle(
                                  fontFamily: 'Noto Sans Thai',
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 12),
                        child: Divider(
                          color: HexColor(
                              '#E4E3E3'), // You can customize the color of the divider
                          thickness:
                              1, // You can adjust the thickness of the divider
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'ใช้สำหรับชำระสินเชื่อของทางศรีสวัสดิ์เท่านั้น',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Noto Sans Thai',
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
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
        // XFile xfile = XFile.fromData(Uint8List.fromList(capImage),
        //     name: '${currentDateTime}.jpg', mimeType: 'image/jpeg');

        // final params = ShareParams(
        //   text: 'Great picture',
        //   files: [xfile],
        //   downloadFallbackEnabled: true,

        // );

        // final result5544 = await SharePlus.instance.share(params);

        // if (result5544.status == ShareResultStatus.success) {
        //   print('Thank you for sharing the picture!');
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(
        //         'Thank you for sharing the picture! ${result5544.toString()}',
        //         style: TextStyle(
        //           color: FlutterFlowTheme.of(context).secondary,
        //         ),
        //       ),
        //       duration: Duration(milliseconds: 4000),
        //       backgroundColor: FlutterFlowTheme.of(context).primaryText,
        //     ),
        //   );
        // }
        // final result1 = await SaverGallery.saveImage(Uint8List.fromList(capImage),
        //     fileName: "${currentDateTime}",
        //     androidRelativePath: "Pictures/Gifs",
        //     skipIfExists: false,
        //     quality: 100);
        // await ImageGallerySaverPlus.saveImage(
        //   Uint8List.fromList(capImage),
        //   quality: 100,
        //   name: "${currentDateTime}",
        // );
        // await ImageGallerySaverPlus.saveImage(byteData.buffer.asUint8List());
      });
      // XFile xfile = XFile.fromData(Uint8List.fromList(capImage),
      //     name: '${currentDateTime}.jpg', mimeType: 'image/jpeg');

      // final params = ShareParams(
      //   text: 'Great picture',
      //   files: [xfile],
      //   downloadFallbackEnabled: true,

      // );

      // final result5544 = await SharePlus.instance.share(params);

      // if (result5544.status == ShareResultStatus.success) {
      //   print('Thank you for sharing the picture!');
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(
      //         'Thank you for sharing the picture! ${result5544.toString()}',
      //         style: TextStyle(
      //           color: FlutterFlowTheme.of(context).secondary,
      //         ),
      //       ),
      //       duration: Duration(milliseconds: 4000),
      //       backgroundColor: FlutterFlowTheme.of(context).primaryText,
      //     ),
      //   );
      // }
      // final result1 = await SaverGallery.saveImage(Uint8List.fromList(capImage),
      //     fileName: "${currentDateTime}",
      //     androidRelativePath: "Pictures/Gifs",
      //     skipIfExists: false,
      //     quality: 100);
      // await ImageGallerySaverPlus.saveImage(
      //   Uint8List.fromList(capImage),
      //   quality: 100,
      //   name: "${currentDateTime}",
      // );
      // await ImageGallerySaverPlus.saveImage(byteData.buffer.asUint8List());
    });

    // Show success message with icon
    // showTopFlash(
    //   margin: EdgeInsets.symmetric(horizontal: 22),
    //   duration: 4,
    //   barrierColor: Colors.transparent,
    //   contents: Container(
    //     width: double.infinity,
    //     color: Color.fromRGBO(0, 0, 0, 0.8),
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
    //       child: Row(
    //         children: [
    //           Icon(Icons.check, color: Colors.green), // Success icon
    //           SizedBox(width: 10),
    //           Text(
    //             'บันทึกรูปภาพสำเร็จ',
    //             style: Theme.of(context).textTheme.labelSmall?.merge(TextStyle(
    //               fontWeight: FontWeight.w400,
    //               // fontFamily: 'NotoSansThaiSemiBold'
    //             )),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    //   context: context,
    // );
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
  String? suffix,
  String? ref1,
  String? ref2,
  double? amount,
  String? taxId,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Step 2: Perform the Multiplication
  double multipliedValue = amount! * 100;

  // Step 3: Format the Result with 2 decimal places
  // String amount100 = multipliedValue.toString();
  String amount100 = '0';
  String data = '''
|$taxId$suffix
$ref1
$ref2
$multipliedValue
''';
  return data;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
