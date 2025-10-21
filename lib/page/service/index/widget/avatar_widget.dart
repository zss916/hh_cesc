import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  const AvatarWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(url)),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
