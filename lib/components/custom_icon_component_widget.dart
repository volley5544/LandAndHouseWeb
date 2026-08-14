import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'custom_icon_component_model.dart';
export 'custom_icon_component_model.dart';

class CustomIconComponentWidget extends StatefulWidget {
  const CustomIconComponentWidget({
    super.key,
    required this.icon,
  });

  final Widget? icon;

  @override
  State<CustomIconComponentWidget> createState() =>
      _CustomIconComponentWidgetState();
}

class _CustomIconComponentWidgetState extends State<CustomIconComponentWidget> {
  late CustomIconComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomIconComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon!;
  }
}
