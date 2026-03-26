import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class TooltipWidget extends StatefulWidget {
  final Widget child;
  final Widget? content;
  const TooltipWidget({super.key, required this.child, this.content});

  @override
  State<TooltipWidget> createState() => _TooltipWidgetState();
}

class _TooltipWidgetState extends State<TooltipWidget> {
  final _controller = SuperTooltipController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuperTooltip(
      barrierConfig: BarrierConfiguration(color: Colors.black38),
      arrowConfig: ArrowConfiguration(
        tipRadius: 1,
        length: 10,
        baseWidth: 15,
        tipDistance: 10,
      ),
      style: TooltipStyle(
        borderWidth: 1,
        borderRadius: 10,
        borderColor: Colors.white,
        backgroundColor: Color(0xFF313540),
      ),
      controller: _controller,
      content: widget.content ?? widget.child,
      child: widget.child,
    );
  }
}
