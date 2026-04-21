import '/flutter_flow/flutter_flow_util.dart';
import 'solar_data_component_widget.dart' show SolarDataComponentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SolarDataComponentModel
    extends FlutterFlowModel<SolarDataComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
