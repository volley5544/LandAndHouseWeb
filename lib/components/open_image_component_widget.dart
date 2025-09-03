import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'open_image_component_model.dart';
export 'open_image_component_model.dart';

class OpenImageComponentWidget extends StatefulWidget {
  const OpenImageComponentWidget({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  State<OpenImageComponentWidget> createState() =>
      _OpenImageComponentWidgetState();
}

class _OpenImageComponentWidgetState extends State<OpenImageComponentWidget> {
  late OpenImageComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpenImageComponentModel());

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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: FlutterFlowExpandedImageView(
                image: Image.network(
                  widget.imageUrl!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    fit: BoxFit.contain,
                  ),
                ),
                allowRotation: false,
                tag: widget.imageUrl!,
                useHeroAnimation: true,
              ),
            ),
          );
        },
        child: Hero(
          tag: widget.imageUrl!,
          transitionOnUserGestures: true,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.imageUrl!,
              width: 250.0,
              height: 250.0,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/error_image.png',
                width: 250.0,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
