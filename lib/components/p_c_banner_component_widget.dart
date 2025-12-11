import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'p_c_banner_component_model.dart';
export 'p_c_banner_component_model.dart';

class PCBannerComponentWidget extends StatefulWidget {
  const PCBannerComponentWidget({super.key});

  @override
  State<PCBannerComponentWidget> createState() =>
      _PCBannerComponentWidgetState();
}

class _PCBannerComponentWidgetState extends State<PCBannerComponentWidget> {
  late PCBannerComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PCBannerComponentModel());

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
                    'assets/images/Banner_Web__281168.png',
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
                    'assets/images/Banner-1.jpg',
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
