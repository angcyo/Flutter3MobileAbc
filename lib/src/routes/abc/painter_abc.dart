import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../main_route.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/02
///

class PainterAbc extends StatefulWidget {
  const PainterAbc({super.key});

  @override
  State<PainterAbc> createState() => _PainterAbcState();
}

class _PainterAbcState extends State<PainterAbc> with BaseAbcStateMixin {
  /// /// ![](https://flutter.github.io/assets-for-api-docs/assets/dart-ui/path_add_arc_dark.png#gh-dark-mode-only)
  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      paintWidget((canvas, size) {
        //中点
        final center = Offset(size.width / 2, size.height / 2);
        //绘制十字线
        final paint = Paint()
          ..color = Colors.red
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
        canvas.drawLine(
          Offset(0, center.dy),
          Offset(size.width, center.dy),
          paint,
        );
        canvas.drawLine(
          Offset(center.dx, 0),
          Offset(center.dx, size.height),
          paint,
        );
        //间隔角度
        const intervalAngle = 30;
        const radius = 100.0;
        //每隔指定的弧度绘制角度信息
        for (var i = 0; i < 360; i += intervalAngle) {
          final angle = i.toRadians;
          final offset = center.translate(
            radius * cos(angle),
            radius * sin(angle),
          );
          canvas.drawLine(center, offset, paint);
          canvas.drawCircle(offset, 2, paint);
          canvas.withTranslate(center.dx, center.dy, () {
            canvas.withRotate(i, () {
              canvas.drawText('$i° ${angle.toDigits()}',
                  offset: const Offset(radius, 0), getOffset: (painter) {
                return Offset(10, painter.height / -2);
              });
            });
          });
        }
      }).constrainedBox(
          BoxConstraints(minWidth: double.maxFinite, minHeight: screenWidth)),
      paintWidget((canvas, size) {
        //中点
        final center = Offset(size.width / 2, size.height / 2);
        //绘制十字线
        final paint = Paint()
          ..color = Colors.red
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;
        canvas.drawLine(
          Offset(0, center.dy),
          Offset(size.width, center.dy),
          paint,
        );
        canvas.drawLine(
          Offset(center.dx, 0),
          Offset(center.dx, size.height),
          paint,
        );
        //弧度列表
        const angleList = [
          0.0,
          pi / 4,
          -pi / 4,
          pi / 2,
          -pi / 2,
          -pi,
          pi * 3 / 4,
          -pi * 3 / 4,
        ];
        const radius = 100.0;
        //每隔指定的弧度绘制角度信息
        for (var angle in angleList) {
          final offset = center.translate(
            radius * cos(angle),
            radius * sin(angle),
          );
          canvas.drawLine(center, offset, paint);
          canvas.drawCircle(offset, 2, paint);
          canvas.withTranslate(center.dx, center.dy, () {
            canvas.withRotateRadians(angle, () {
              canvas.drawText('${angle.toDegrees}° ${angle.toDigits()}',
                  offset: const Offset(radius, 0), getOffset: (painter) {
                return Offset(10, painter.height / -2);
              });
            });
          });
        }
      }).constrainedBox(
          BoxConstraints(minWidth: double.maxFinite, minHeight: screenWidth)),
      paintWidget((canvas, size) {
        final circlePath = Path()
          ..addOval(
              Rect.fromCircle(center: const Offset(100, 100), radius: 100));
        final arcPath = Path()
          ..addArc(
              const Rect.fromLTWH(0, 0, 200, 250), 0.toRadians, 360.toRadians);
        drawPath(arcPath, canvas, size);
      }).constrainedBox(
          BoxConstraints(minWidth: double.maxFinite, minHeight: screenWidth)),
      paintWidget((canvas, size) {
        final arcPath = Path()
          ..addArc(
              const Rect.fromLTWH(0, 0, 200, 250), 0.toRadians, -360.toRadians);
        drawPath(arcPath, canvas, size);
      }).constrainedBox(
          BoxConstraints(minWidth: double.maxFinite, minHeight: screenWidth)),
    ];
  }

  @entryPoint
  void drawPath(Path path, Canvas canvas, Size size) {
    final drawPath = path;

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.withTranslate(100, 100, () {
      canvas.drawPath(drawPath, paint);

      drawPath.eachPathMetrics(
          (posIndex, ratio, contourIndex, position, angle, isClosed) {
        canvas.withRotateRadians(angle, () {
          final p = position + const Offset(20, 0);
          canvas.drawLine(position, p, paint);
          //绘制一个向右的三角形
          canvas.drawPath(
              Path()
                ..moveTo(p.dx, p.dy - 5)
                ..lineTo(p.dx + 10, p.dy)
                ..lineTo(p.dx, p.dy + 5)
                ..close(),
              paint);
          canvas.drawText("${angle.toDegrees.toDigits()}°" /*angle.toDigits()*/,
              offset: p, getOffset: (painter) {
            return Offset(10, painter.height / -2);
          }, fontSize: 8);
        }, anchor: position);
      }, 30.0);
    });
  }
}
