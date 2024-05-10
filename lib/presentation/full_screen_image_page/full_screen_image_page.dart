import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;
  final String title;

  const FullScreenImagePage({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Center(
              child: Hero(
                tag: 'imageHero',
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 350),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
