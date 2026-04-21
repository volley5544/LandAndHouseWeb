import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'solar_p_c_banner_component_model.dart';
export 'solar_p_c_banner_component_model.dart';

class SolarPCBannerComponentWidget extends StatefulWidget {
  const SolarPCBannerComponentWidget({super.key});

  @override
  State<SolarPCBannerComponentWidget> createState() =>
      _SolarPCBannerComponentWidgetState();
}

class _SolarPCBannerComponentWidgetState
    extends State<SolarPCBannerComponentWidget> {
  late SolarPCBannerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolarPCBannerComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0x00FFFFFF),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                constraints: BoxConstraints(
                  minWidth: 449.0,
                  minHeight: 150.0,
                  maxWidth: 1018.0,
                  maxHeight: 340.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    'assets/images/Banner_Solar_200469_(1).png',
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/Banner_Solar_200469_(1).png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
