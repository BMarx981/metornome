import 'package:flutter/material.dart';

class TriangleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF8ADCAF)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height); // Top-left point
    path.lineTo(size.width, size.height); // Bottom-right point
    path.lineTo(size.width / 2, 0); // Top point
    path.close();

    canvas.drawShadow(
      path, // Path of the shape
      Colors.black, // Shadow color
      5.0, // Shadow elevation
      true, // Whether the shadow should be transparent for anti-aliasing
    );

    // Draw the actual triangle shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
