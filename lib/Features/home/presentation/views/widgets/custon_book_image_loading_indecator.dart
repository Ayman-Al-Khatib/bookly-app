import 'package:flutter/material.dart';

class CustonBookImageLoadingIndecator extends StatelessWidget {
  const CustonBookImageLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          color: Colors.white24,
        ),
      ),
    );
  }
}
