import 'dart:math';
import '../config/colors.dart';
import 'package:flutter/material.dart';

class PieChartCustomPainter extends CustomPainter {
  final List categories;
  final double width;
  PieChartCustomPainter({required this.categories, required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = 0;
    double startRadian = -pi / 2;
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 1.8;
    for (var f in categories) {
      total += f['amount'];
    }
    for (var i = 0; i < categories.length; i++) {
      final currentCategory = categories[i];
      final sweepRadian = (currentCategory['amount'] / total) * 2 * pi;
      paint.color = AppColors.pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
