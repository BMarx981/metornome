import 'package:flutter/material.dart';
import 'dart:math';

class EnhancedKnobWidget extends StatefulWidget {
  /// Diameter of the knob
  final double size; 
  /// Callback for normalized value
  final ValueChanged<double> onChanged; 
  /// Number of snap intervals (e.g., 10 for 0–100 in steps of 10)
  final int divisions; 
  /// Minimum normalized value
  final double minValue; 
  /// Maximum normalized value
  final double maxValue; 
  // Color of the knob
  final Color color; 

  const EnhancedKnobWidget({
    super.key,
    this.size = 150,
    required this.onChanged,
    this.divisions = 10,
    this.minValue = 0,
    this.maxValue = 100,
    this.color = Colors.blue,
  });

  @override
  _EnhancedKnobWidgetState createState() => _EnhancedKnobWidgetState();
}

class _EnhancedKnobWidgetState extends State<EnhancedKnobWidget> {
  double _angle = 0; // Current angle in radians

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        final center = Offset(widget.size / 2, widget.size / 2);
        final position = details.localPosition;

        // Calculate the angle based on touch position relative to the center
        final deltaX = position.dx - center.dx;
        final deltaY = position.dy - center.dy;
        final newAngle = atan2(deltaY, deltaX);

        setState(() {
          _angle = newAngle;
        });

        // Normalize the angle and call the callback
        final normalizedValue = _normalizeValue(_angle);
        widget.onChanged(normalizedValue);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background with ticks
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: _KnobPainter(
              divisions: widget.divisions,
              color: widget.color,
            ),
          ),

          // Rotating arrow
          Transform.rotate(
            angle: _angle,
            child: Icon(
              Icons.arrow_upward,
              size: widget.size * 0.4,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Normalize angle to a value between minValue and maxValue
  double _normalizeValue(double angle) {
    // Convert angle to a value in the range [0, divisions)
    final normalizedAngle = (angle + pi) / (2 * pi); // Map [-pi, pi] to [0, 1]
    final rawValue = normalizedAngle * widget.divisions;
    final snappedValue = rawValue.roundToDouble(); // Snap to the nearest interval

    // Map snapped value to the minValue–maxValue range
    return widget.minValue +
        (snappedValue / widget.divisions) * (widget.maxValue - widget.minValue);
  }
}

class _KnobPainter extends CustomPainter {
  final int divisions;
  final Color color;

  _KnobPainter({required this.divisions, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tickPaint = Paint()
      ..color = color
      ..strokeWidth = 2;

    final Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [color.withOpacity(0.8), Colors.grey[300]!],
      ).createShader(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ));

    // Draw the gradient background
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      gradientPaint,
    );

    // Draw ticks
    final double radius = size.width / 2;
    for (int i = 0; i < divisions; i++) {
      final angle = (i / divisions) * 2 * pi - pi / 2;
      final startX = radius + radius * cos(angle);
      final startY = radius + radius * sin(angle);
      final endX = radius + (radius - 10) * cos(angle);
      final endY = radius + (radius - 10) * sin(angle);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
