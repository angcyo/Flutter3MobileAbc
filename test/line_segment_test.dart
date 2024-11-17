import 'dart:math';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/11/17
///
/// 已知点1, 点2, 分成N段, 计算出N段的点坐标
void main() {
  final p1x = 0.0;
  final p1y = 0.0;

  final p2x = 100.0;
  final angle = 30; //角度
  final p2y = p2x * tan(angle.hd);

  // 要分的段数(输出N+1个点)
  final n = 4;
  //线段的总长度
  final c = cl(p2x - p1x, p2x - p2y);
  //每段长度
  final sc = c / n;
  colorLog("0->$p1x, $p1y");
  colorErrorLog("用a/b边进行平分分段↓");
  for (var i = 1; i < n; i++) {
    final a = p1x + (p2x - p1x) / n * i;
    final b = p1y + (p2y - p1y) / n * i;
    colorLog("$i->$a, $b");
  }
  /*colorErrorLog("用a/b边平分求c分段↓");
  for (var i = 1; i < n; i++) {
    final a = p1x + (p2x - p1x) / n * i;
    final b = p1y + (p2y - p1y) / n * i;
    colorLog("$i->$a, $b");
  }*/
  colorErrorLog("用c边进行平分分段↓");
  for (var i = 1; i < n; i++) {
    final a = cos(angle.hd) * sc * i;
    final b = sin(angle.hd) * sc * i;
    colorLog("$i->$a, $b");
  }
  colorErrorLog("--");
  colorLog("${n + 1}->$p2x, $p2y");
}

/// 对角线的长度, c边的长度
double cl(double x, double y) {
  return sqrt(pow(x, 2) + pow(y, 2));
}

void colorLog(dynamic msg, [int col = 93]) {
  print('\x1B[38;5;${col}m$msg');
}

void colorErrorLog(dynamic msg, [int col = 9]) {
  print('\x1B[38;5;${col}m$msg');
}

extension NumEx on num {
  double get toRadians => this * pi / 180;

  double get toDegrees => this * 180 / pi;

  /// 转弧度
  double get hd => toRadians;

  double get jd => toDegrees;
}
