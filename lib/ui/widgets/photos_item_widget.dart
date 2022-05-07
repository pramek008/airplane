import 'package:flutter/material.dart';

class PhotosItemWidget extends StatelessWidget {
  final String imgUrl;

  const PhotosItemWidget({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imgUrl,
          height: 70,
          width: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
