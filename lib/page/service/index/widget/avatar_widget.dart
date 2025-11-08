import 'package:cached_network_image/cached_network_image.dart';
import 'package:cescpro/generated/assets.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String url;
  const AvatarWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(url),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          )
        : Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Color(0xFF313540),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [Image.asset(Assets.imgLogo, width: 60, height: 60)],
            ),
          );
  }
}
