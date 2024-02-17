import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/02/06
///
class MatrixAbc extends StatefulWidget {
  const MatrixAbc({super.key});

  @override
  State<MatrixAbc> createState() => _MatrixAbcState();
}

class _MatrixAbcState extends State<MatrixAbc> with BaseAbcStateMixin {
  Matrix4 matrix4 = Matrix4.identity();

  String result = '';

  /// 旋转步长, 弧度单位 30 = 0.5235987755982988
  double rotateStep = 45.toRadians; //pi / 8;

  void _translateX() {
    matrix4.translate(10.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _translateY() {
    matrix4.translate(0.0, 10.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _translateZ() {
    matrix4.translate(0.0, 0, 10.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _scaleX() {
    matrix4.scale(1.1, 1.0, 1.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _scaleY() {
    matrix4.scale(1.0, 1.1, 1.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _scaleZ() {
    matrix4.scale(1.0, 1.0, 1.1);
    setState(() {
      result = matrix4.toString();
    });
  }

  /// 旋转X轴, 弧度单位
  void rotateX() {
    matrix4.rotateX(rotateStep);
    setState(() {
      result = matrix4.toString();
    });
  }

  void rotateY() {
    matrix4.rotateY(rotateStep);
    setState(() {
      result = matrix4.toString();
    });
  }

  /// 意义上的旋转, 其实就是旋转Z轴
  void rotateZ() {
    matrix4.rotateZ(rotateStep);
    setState(() {
      result = matrix4.toString();
    });
  }

  void _reset() {
    matrix4 = Matrix4.identity();
    setState(() {
      result = matrix4.toString();
    });
  }

  /// 重置平移
  void _resetTranslate() {
    matrix4 = matrix4.clone()..setTranslation(Vector3.zero());
    setState(() {
      result = matrix4.toString();
    });
  }

  /// 重置缩放
  void _resetScale() {
    matrix4 = matrix4.clone()..scaleTo(sx: 1.0, sy: 1.0, sz: 1.0);
    setState(() {
      result = matrix4.toString();
    });
  }

  /// 重置旋转
  void _resetRotate() {
    matrix4 = matrix4.clone()..setRotation(Matrix3.identity());
    setState(() {
      result = matrix4.toString();
    });
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    const height = 30.0;
    const digits = 6;
    postCallback(() {
      matrix4.decomposeTest();
    });
    return [
      matrix4.toMatrixString().trim().text(fontSize: 12),
      matrix4.toString().trim().text(fontSize: 8),
      GradientButton(
        onTap: _reset,
        minHeight: height,
        child: "重置".text(),
      ).paddingAll(kH),
      [
        GradientButton(
          onTap: _resetTranslate,
          minHeight: height,
          child: "重置".text(),
        ),
        GradientButton(
          onTap: _translateX,
          minHeight: height,
          child: "平移x".text(),
        ),
        GradientButton(
          onTap: _translateY,
          minHeight: height,
          child: "平移y".text(),
        ),
        GradientButton(
          onTap: _translateZ,
          minHeight: height,
          child: "平移z".text(),
        ),
      ].wrap()!.padding(kH, 2),
      [
        GradientButton(
          onTap: _resetScale,
          minHeight: height,
          child: "重置".text(),
        ),
        GradientButton(
          onTap: _scaleX,
          minHeight: height,
          child: "缩放x".text(),
        ),
        GradientButton(
          onTap: _scaleY,
          minHeight: height,
          child: "缩放y".text(),
        ),
        GradientButton(
          onTap: _scaleZ,
          minHeight: height,
          child: "缩放z".text(),
        ),
      ].wrap()!.padding(kH, 2),
      [
        GradientButton(
          onTap: _resetRotate,
          minHeight: height,
          child: "重置".text(),
        ),
        GradientButton(
          onTap: rotateX,
          minHeight: height,
          child: "旋转x".text(),
        ),
        GradientButton(
          onTap: rotateY,
          minHeight: height,
          child: "旋转y".text(),
        ),
        GradientButton(
          onTap: rotateZ,
          minHeight: height,
          child: "旋转z".text(),
        ),
      ].wrap()!.padding(kH, 2),
      [
        const FlutterLogo().colorFiltered().ratio(1.9),
        const FlutterLogo().transform(matrix4).ratio(1.9),
      ].stack()!,
      [
        textSpanBuilder((builder) {
          builder.addText("平移:\n",
              style: const TextStyle(fontSize: 16, color: Colors.red));
          builder.addText(
              "x: ${matrix4.translateX.toDigits(digits: digits)}\ny: ${matrix4.translateY.toDigits(digits: digits)}\nz: ${matrix4.translateZ.toDigits(digits: digits)}");
        }).expanded(),
        textSpanBuilder((builder) {
          builder.addText("缩放:\n",
              style: const TextStyle(fontSize: 16, color: Colors.red));
          builder.addText(
              "x: ${matrix4.scaleX.toDigits(digits: digits)}\ny: ${matrix4.scaleY.toDigits(digits: digits)}\nz: ${matrix4.scaleZ.toDigits(digits: digits)}");
        }).expanded(),
        textSpanBuilder((builder) {
          builder.addText("旋转:\n",
              style: const TextStyle(fontSize: 16, color: Colors.red));
          builder.addText(
              "x: ${matrix4.rotationX.toDigits(digits: digits)}\ny: ${matrix4.rotationY.toDigits(digits: digits)}\nz: ${matrix4.rotationZ.toDigits(digits: digits)}");
        }).expanded()
      ].row()!,
    ];
  }
}
