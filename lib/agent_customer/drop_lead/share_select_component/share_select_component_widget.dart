import '/auth/custom_auth/auth_util.dart';
import '/components/message_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'share_select_component_model.dart';
export 'share_select_component_model.dart';

class ShareSelectComponentWidget extends StatefulWidget {
  const ShareSelectComponentWidget({super.key});

  @override
  State<ShareSelectComponentWidget> createState() =>
      _ShareSelectComponentWidgetState();
}

class _ShareSelectComponentWidgetState
    extends State<ShareSelectComponentWidget> {
  late ShareSelectComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareSelectComponentModel());

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
                    child: Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          if (loggedIn) {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    '${FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebLeadUrl : FFAppState().apiUrlDocData.agentWebLeadUrlUat}?agentCode=${FFAppState().agentProfileDataType.agentCode}'));
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: MessageComponentWidget(
                                    textMessage:
                                        'คัดลอกลิงค์สำเร็จ : ${'${FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebLeadUrl : FFAppState().apiUrlDocData.agentWebLeadUrlUat}?agentCode=${FFAppState().agentProfileDataType.agentCode}'}',
                                  ),
                                );
                              },
                            );
                          } else {
                            await actions.returnTextToAppreturnTextToApp(
                              'เพื่อนคุณแนะนำ สินเชื่อเงินด่วน วงเงินสูง ได้เงินไว | ประกันรถยนต์ ผ่อนเงินสดได้ที่ศรีสวัสดิ์ เงินสดทันใจ สนใจคลิก ${FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebLeadUrl : FFAppState().apiUrlDocData.agentWebLeadUrlUat}?agentCode=${FFAppState().agentProfileDataType.agentCode}',
                              'shareLink',
                            );
                          }

                          Navigator.pop(context);
                        },
                        text: loggedIn ? 'คัดลอกลิงค์' : 'แชร์ลิงก์',
                        icon: FaIcon(
                          FontAwesomeIcons.link,
                          size: 30.0,
                        ),
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 50.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Noto San Thai',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
                        if (loggedIn) {
                          await actions.saveImageRefer(
                            context,
                            '${FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebLeadUrl : FFAppState().apiUrlDocData.agentWebLeadUrlUat}?agentCode=${FFAppState().agentProfileDataType.agentCode}',
                          );
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content: Text('บันทึกภาพสำเร็จ'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          await actions.shareImage(
                            context,
                            '${FFDevEnvironmentValues().isProduction ? FFAppState().apiUrlDocData.agentWebLeadUrl : FFAppState().apiUrlDocData.agentWebLeadUrlUat}?agentCode=${FFAppState().agentProfileDataType.agentCode}',
                            'image',
                          );
                        }

                        Navigator.pop(context);
                      },
                      text: loggedIn ? 'บันทึก QR แนะนำ' : 'แชร์รูปภาพ QR',
                      icon: Icon(
                        Icons.image_outlined,
                        size: 30.0,
                      ),
                      options: FFButtonOptions(
                        height: 50.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
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
