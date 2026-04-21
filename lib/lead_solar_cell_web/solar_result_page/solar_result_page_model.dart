import '/flutter_flow/flutter_flow_util.dart';
import '/lead_solar_cell_web/solar_data_component/solar_data_component_widget.dart';
import '/lead_solar_cell_web/solar_p_c_banner_component/solar_p_c_banner_component_widget.dart';
import 'solar_result_page_widget.dart' show SolarResultPageWidget;
import 'package:flutter/material.dart';

class SolarResultPageModel extends FlutterFlowModel<SolarResultPageWidget> {
  ///  Local state fields for this page.

  bool isSearchByChanod = true;

  ///  State fields for stateful widgets in this page.

  // Model for SolarPCBannerComponent component.
  late SolarPCBannerComponentModel solarPCBannerComponentModel;
  // Model for SolarDataComponent component.
  late SolarDataComponentModel solarDataComponentModel;

  @override
  void initState(BuildContext context) {
    solarPCBannerComponentModel =
        createModel(context, () => SolarPCBannerComponentModel());
    solarDataComponentModel =
        createModel(context, () => SolarDataComponentModel());
  }

  @override
  void dispose() {
    solarPCBannerComponentModel.dispose();
    solarDataComponentModel.dispose();
  }

  /// Action blocks.
  Future checkIsFromChanodPage(BuildContext context) async {}
}
