import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;

  ImageDetailScreen({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/icon-Huoon.jpg'), // Cambia la imagen si es necesario
            ),
            Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Roboto',
            ),
          ),
          ],
        ),
        backgroundColor: Colors.white, // Personaliza el color del AppBar
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          
          Expanded(
            child: Center(
              child: GestureDetector(
                onDoubleTap: () => Navigator.pop(context),
                child: InteractiveViewer(
                  minScale: 0.1,
                  maxScale: 7.0,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
