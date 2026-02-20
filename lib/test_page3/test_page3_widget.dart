import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/api_requests/api_streaming.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'test_page3_model.dart';
export 'test_page3_model.dart';

class TestPage3Widget extends StatefulWidget {
  const TestPage3Widget({super.key});

  static String routeName = 'TestPage3';
  static String routePath = '/testPage3';

  @override
  State<TestPage3Widget> createState() => _TestPage3WidgetState();
}

class _TestPage3WidgetState extends State<TestPage3Widget> {
  late TestPage3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPage3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.streamApiResult = await CheckinStreamingAPICall.call();
      if (_model.streamApiResult?.succeeded ?? true) {
        final streamSubscription = _model
            .streamApiResult?.streamedResponse?.stream
            .transform(utf8.decoder)
            .transform(const LineSplitter())
            .transform(ServerSentEventLineTransformer())
            .map((m) => ResponseStreamMessage(message: m))
            .listen(
          (onMessageInput) async {
            _model.updateCheckinDataStruct(
              (e) => e
                ..time = '${onMessageInput.serverSentEvent.data}'
                ..count = getJsonField(
                  onMessageInput.serverSentEvent.jsonData,
                  r'''$.count''',
                ),
            );
            safeSetState(() {});
          },
          onError: (onErrorInput) async {},
          onDone: () async {},
        );
        // Add the subscription to the active streaming response subscriptions
        // in API Manager so that it can be cancelled at a later time.
        ApiManager.instance.addActiveStreamingResponseSubscription(
          '5544',
          streamSubscription,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'TestPage3',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Text(
                  'Page Title',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Noto San Thai',
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.checkinData?.time,
                                        'time',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.checkinData?.count.toString(),
                                        'count',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Noto San Thai',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
