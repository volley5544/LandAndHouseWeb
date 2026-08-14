// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWidget extends StatefulWidget {
  const SvgIconWidget({
    super.key,
    this.width,
    this.height,
    this.svgUrl,
    this.color,
  });

  final double? width;
  final double? height;
  final String? svgUrl;
  final Color? color;

  @override
  State<SvgIconWidget> createState() => _SvgIconWidgetState();
}

class _SvgIconWidgetState extends State<SvgIconWidget> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      widget.svgUrl!,
      width: widget.width ?? 24,
      height: widget.height ?? 24,
      colorFilter: ColorFilter.mode(
          widget.color!, BlendMode.srcIn), // tintable like an Icon
      placeholderBuilder: (_) => const Icon(Icons.image_outlined),
    );
  }
}
