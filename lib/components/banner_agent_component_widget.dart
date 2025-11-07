import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'banner_agent_component_model.dart';
export 'banner_agent_component_model.dart';

class BannerAgentComponentWidget extends StatefulWidget {
  const BannerAgentComponentWidget({super.key});

  @override
  State<BannerAgentComponentWidget> createState() =>
      _BannerAgentComponentWidgetState();
}

class _BannerAgentComponentWidgetState
    extends State<BannerAgentComponentWidget> {
  late BannerAgentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BannerAgentComponentModel());

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
                    'assets/images/Banner-app-Intro--01.jpg',
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
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/images/Banner-app-Intro--01.jpg',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
