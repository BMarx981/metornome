import 'package:flutter/material.dart';

class TriangleShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height); // Top-left point
    path.lineTo(size.width, size.height); // Bottom-right point
    path.lineTo(size.width / 2, 0); // Top point
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
