import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String? imageUrl;
 
  const ImageView({super.key, 
    this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: PhotoView(
            imageProvider: (NetworkImage(imageUrl!)),
          ),
        ),
      ),
    );
  }
}

