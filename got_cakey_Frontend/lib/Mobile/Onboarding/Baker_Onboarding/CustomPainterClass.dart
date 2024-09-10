// import 'package:flutter/material.dart';

// class CustomPainterClass extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0;
//     List<Path> pathArray = [];
//     double x1 = 0;
//     double y1 = 0;
//     double x2 = 10;
//     double y2 = 10;

//     final path1 = Path()
//       ..moveTo(50, 50) // Move to starting point
//       ..lineTo(40, 50);
//     final path2 = Path()
//       ..moveTo(65, 50) // Move to starting point
//       ..lineTo(55, 50);
//     final path3 = Path()
//       ..moveTo(80, 50) // Move to starting point
//       ..lineTo(70, 50);
//     final path4 = Path()
//       ..moveTo(95, 50) // Move to starting point
//       ..lineTo(85, 50);
//     Rect rect = Rect.fromCircle(center: Offset(90, 69), radius: 20);
//     final arc1 = Path()..arcTo(rect, -1, 0.4, false);
//     canvas.drawPath(path1, paint);
//     canvas.drawPath(path2, paint);
//     canvas.drawPath(path3, paint);
//     canvas.drawPath(path4, paint);
//     canvas.drawPath(arc1, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     throw UnimplementedError();
//   }
// }
