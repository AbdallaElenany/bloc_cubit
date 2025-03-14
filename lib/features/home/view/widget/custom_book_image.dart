import 'package:flutter/material.dart';
import '../../../../core/share_widgets/custom_cached_network_image.dart';


class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .3;
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: 1.3 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CustomCachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
