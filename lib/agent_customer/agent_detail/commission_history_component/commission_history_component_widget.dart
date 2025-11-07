import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'commission_history_component_model.dart';
export 'commission_history_component_model.dart';

class CommissionHistoryComponentWidget extends StatefulWidget {
  const CommissionHistoryComponentWidget({
    super.key,
    required this.data,
  });

  final List<AgentCommisionHistoryDataModelStruct>? data;

  @override
  State<CommissionHistoryComponentWidget> createState() =>
      _CommissionHistoryComponentWidgetState();
}

class _CommissionHistoryComponentWidgetState
    extends State<CommissionHistoryComponentWidget> {
  late CommissionHistoryComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommissionHistoryComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Builder(
            builder: (context) {
              final list = widget.data!.toList();

              return FlutterFlowDataTable<AgentCommisionHistoryDataModelStruct>(
                controller: _model.paginatedDataTableController,
                data: list,
                numRows: list.length,
                columnsBuilder: (onSortChanged) => [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '         สถานะ',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '          งวดชำระ',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'จำนวนเงินที่ได้รับ (บาท)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        'ภาษีหัก ณ ที่จ่าย (บาท)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '          ได้รับแล้ว\n          (บาท)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '            ค้างจ่าย\n            (บาท)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '       ยอดคงเหลือ\n          (บาท)',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '  วันครบกำหนดจ่าย \n      (วัน-เดือน-ปี)',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        '       วันที่จ่ายจริง\n       (วัน-เดือน-ปี)',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Noto San Thai',
                              color: Color(0xFC000000),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
                dataRowBuilder:
                    (listItem, listIndex, selected, onSelectChanged) => DataRow(
                  color: WidgetStateProperty.all(
                    listIndex % 2 == 0
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  cells: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        listItem.comPayStatus,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: () {
                                if (listItem.comPayStatus == 'จ่ายแล้ว') {
                                  return FlutterFlowTheme.of(context).success;
                                } else if (listItem.comPayStatus ==
                                    'รอจ่ายรอบถัดไป') {
                                  return FlutterFlowTheme.of(context).primary;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        listItem.comInstallmentNo,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.returnNumberWithComma2Decimal(
                              listItem.comPayAmt),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions
                              .returnNumberWithComma2Decimal(listItem.comTax),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.returnNumberWithComma2Decimal(
                              listItem.comReceiveAmt),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.returnNumberWithComma2Decimal(
                              listItem.comUnpaidAmt),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          functions.returnNumberWithComma2Decimal(
                              listItem.comRemainingAmt),
                          '0',
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        listItem.comDueDate,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        listItem.comPaymentDate,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Noto San Thai',
                              color: listItem.comPayStatus == 'รอจ่ายรอบถัดไป'
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ].map((c) => DataCell(c)).toList(),
                ),
                paginated: false,
                selectable: false,
                minWidth: 1200.0,
                headingRowHeight: 56.0,
                dataRowHeight: 48.0,
                columnSpacing: 20.0,
                headingRowColor: Color(0xFFF9BB81),
                borderRadius: BorderRadius.circular(8.0),
                addHorizontalDivider: true,
                addTopAndBottomDivider: true,
                hideDefaultHorizontalDivider: false,
                horizontalDividerColor: FlutterFlowTheme.of(context).primary,
                horizontalDividerThickness: 1.0,
                addVerticalDivider: true,
                verticalDividerColor: FlutterFlowTheme.of(context).alternate,
                verticalDividerThickness: 1.0,
              );
            },
          ),
        ),
      ],
    );
  }
}
