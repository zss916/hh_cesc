import 'package:flutter/material.dart';
import 'package:pull_to_refresh_simple/pull_to_refresh_simple.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialClassicHeader(height: 40, color: Colors.black);
  }
}
