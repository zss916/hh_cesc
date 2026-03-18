import 'package:cached_network_image/cached_network_image.dart';
import 'package:cescpro/generated/assets.dart';
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
        color: Color(0xFF313540),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        errorWidget: (BuildContext context, String url, Object error) {
          return Image.asset(Assets.imgLogo);
        },
        progressIndicatorBuilder:
            (BuildContext context, String url, DownloadProgress progress) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                ],
              );
            },
        /*placeholder: (BuildContext context, String url) {
          return Image.asset(Assets.imgLogo);
        },*/
      ),
    );

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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(Assets.imgLogo),
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          );
  }
}
