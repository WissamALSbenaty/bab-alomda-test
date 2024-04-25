
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bab_alomda/core/presentation/app_style.dart';
import 'package:bab_alomda/core/presentation/assets.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imagePath,heroTag;
  final double? width,height;
  final void Function()? onPressImage;
  final BoxFit? boxFit;
  final BorderRadius radius;
  final BoxShape shape;
const CustomNetworkImage({required this.imagePath, super.key,this.shape=BoxShape.rectangle,
  this.onPressImage,this.boxFit,this.radius= AppStyle.borderRadius,this.heroTag,
  this.height, this.width});

  @override
  Widget build(final BuildContext context) {
    final Widget child=GestureDetector(
      onTap: onPressImage,
      child: ClipRRect(
        borderRadius: radius,
          child: ClipOval(
            clipBehavior:shape==BoxShape.circle?Clip.antiAliasWithSaveLayer: Clip.none,
            child: CachedNetworkImage(
              fit: shape==BoxShape.circle?BoxFit.cover:boxFit,
              imageUrl: imagePath??'',
              errorWidget:(final _,final __,final ___)=> Icon(Icons.close),
              placeholder:(final _,final __,)=> CircularProgressIndicator(),

            height: height,width: width),
          ),
        ),
      );
    return heroTag!=null?Hero(tag: heroTag!, child: child,transitionOnUserGestures: true,):child;
  }
}
