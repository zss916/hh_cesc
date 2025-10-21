import 'dart:async';

import 'package:flutter/material.dart';

class AutoScrollWidget extends StatefulWidget {
  final Widget? child;

  const AutoScrollWidget({super.key, this.child});

  @override
  State<AutoScrollWidget> createState() => _AutoScrollWidgetState();
}

class _AutoScrollWidgetState extends State<AutoScrollWidget> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      _scrollBg();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _scrollBg() {
    final double maxScrollExtent = _controller.position.maxScrollExtent;
    final double pixels = _controller.position.pixels;
    if (pixels >= maxScrollExtent) {
      _controller.jumpTo(0.0);
    } else {
      _controller.jumpTo(pixels + 0.25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: Stack(
        children: [
          Positioned.fill(
            child: IgnorePointer(
              child: SingleChildScrollView(
                controller: _controller,
                child: Text(
                  "ddddfsdalfjldsjalfjkldsajflkjadslkfsdafjlsadjfjlkdsajflkjdsalkjflkasdncljadslfjlksadnvjnadlkfmdlsknflksdalknflkdsnaflksadnlkfnlsdkadflkndsalkfmnjasdnfklnsdalknflkasnlfkjoawejmvlknawefkldsmlkfnlasdflkndsajfnawjifojlsdknljfasdhlfj,nbveriuhfjewfklsdnfkhsanfjkdsbakjbfjksadbkjb",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
