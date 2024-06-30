import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/06/30
///
class HummingBirdAdjust {
  /// 入参配置
  double xFactor = 1; //失真x值 (0.875-1.0)  左上 右上 横向
  double yFactor = 1; //失真y值 (0.875-1.0)  纵向
  double x2Factor = 1; //失真x值 (0.875-1.0) 左下 右下 横向
  double y2Factor = 1; //失真y值 (0.875-1.0) 纵向

  /// 最后的点位需要旋转的角度
  double rotateAngle = 0;

  /// 固定参数
  double pXMin = -32768;
  double pXMax = 32767; //65535
  double pYMin = -32768;
  double pYMax = 32767; //65535
  double pXCenter = 0;
  double pYCenter = 0;

  double pXStep = 1024; //65535/65 = 1008
  double pYStep = 1024;
  int xCount = 65;
  int yCount = 65;

  double pi = 3.1415926535897932;

  //焦距(mm)
  double scanHigh = 100;

  //振镜最大偏角(度)
  double scanAngle = 20;

  //振镜X,Y间距(mm);
  double scanDis = 5;

  ///输出
  @output
  UiImage? outputLogImage;

  /// 更新点数
  @api
  void updateCount({
    required int xCount,
    required int yCount,
  }) {
    this.xCount = xCount;
    this.yCount = yCount;

    pXStep = ((65 - 1) / (xCount - 1) * 1024).ceil().toDouble();
    pYStep = ((65 - 1) / (yCount - 1) * 1024).ceil().toDouble();
  }

  /// 更新起止范围
  @api
  void updateXY({
    required double xMin,
    required double xMax,
    required double yMin,
    required double yMax,
  }) {
    pXMin = xMin;
    pXMax = xMax;
    pYMin = yMin;
    pYMax = yMax;
    pXCenter = ((pXMax - pXMin) / 2).ceilToDouble() + pXMin;
    pYCenter = ((pYMax - pYMin) / 2).ceilToDouble() + pYMin;
  }

  /// 4个关键入参
  @api
  @callPoint
  Future<List<Offset>> adjust({
    String? logName, //日志文件名称, 不含扩展
  }) async {
    final int xCenter = (xCount / 2.0).ceil();
    final int yCenter = (yCount / 2.0).ceil();

    //返回的结果数据, 合并了x/y 一维数组
    List<Offset> result = [];

    //二维数组
    List<List<double>> xPointList =
        List.generate(xCount, (index) => List.generate(yCount, (index) => 0.0));
    List<List<double>> yPointList =
        List.generate(xCount, (index) => List.generate(yCount, (index) => 0.0));

    //分别初始化x/y坐标表
    for (var i = 0; i < xCount; i++) {
      for (var j = 0; j < yCount; j++) {
        xPointList[i][j] = (pXMin + j * pXStep);
        yPointList[i][j] = (pYMin + i * pYStep);

        //最后一列, x为最大值
        if (j >= xCount - 1) xPointList[i][j] = pXMax;
        //最后一行, y为最大值
        if (i >= yCount - 1) yPointList[i][j] = pYMax;
      }
    }

    //开始矫正

    final xMin, xMax, yMin, yMax;
    xMin = -(scanHigh + scanDis) * tan(scanAngle * pi / 180.0);
    yMin = -scanHigh * tan(scanAngle * pi / 180.0);
    xMax = (scanHigh + scanDis) * tan(scanAngle * pi / 180.0);
    yMax = scanHigh * tan(scanAngle * pi / 180.0);

    double scanKY = (pYMax - pYMin) / (yMax - yMin); //单位是bits/mm
    double scanKX = scanKY; //强制=y, 否则结果不对

    double angle = scanAngle * pi / 180.0;

    //临时x/y坐标表
    double y;
    List<List<double>> tempXPointList =
        List.generate(xCount, (index) => List.generate(yCount, (index) => 0.0));
    List<List<double>> tempYPointList =
        List.generate(xCount, (index) => List.generate(yCount, (index) => 0.0));

    double A = 0, B = 0, topX, topY, pX, pY;
    double oldY;

    //先矫正左半边
    for (var i = 0; i < xCenter; i++) {
      oldY = yPointList[i][0] / scanKY;

      if ((yFactor != 1) && (oldY != 0)) {
        topX = atan(xMin / (sqrt(pow(scanHigh, 2) + pow(oldY, 2)) + scanDis)) *
            (pXMax / angle) /
            scanKX;
        topY = atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
        pX = 0;
        pY = yFactor * 0.99 * topY;
        A = fabs(pY);
        B = fabs(A * topX / sqrt(topY * topY - A * A));
      }

      //左半边, 一行一行
      for (var j = 0; j < yCount; j++) {
        tempXPointList[i][j] = (xPointList[i][j] / scanKX);
        tempYPointList[i][j] = (yPointList[i][j] / scanKY);

        if (j < yCenter) {
          //左上角
          if (xFactor != 1) {
            tempXPointList[i][j] = atan(tempXPointList[i][j] /
                    (sqrt(pow(scanHigh, 2) +
                            pow(oldY, 2) * (1 - xFactor) * 32) +
                        scanDis)) *
                (pXMax / angle) /
                scanKX;
            tempYPointList[i][j] =
                atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
          }
        } else {
          //左下角
          if (x2Factor != 1) {
            tempXPointList[i][j] = atan(tempXPointList[i][j] /
                    (sqrt(pow(scanHigh, 2) +
                            pow(oldY, 2) * (1 - x2Factor) * 32) +
                        scanDis)) *
                (pXMax / angle) /
                scanKX;
            tempYPointList[i][j] =
                atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
          }
        }

        if ((yFactor != 1) && (oldY != 0)) {
          tempYPointList[i][j] =
              A * sqrt(1 + pow(tempXPointList[i][j], 2) / pow(B, 2));
          if (oldY < 0) {
            tempYPointList[i][j] = -tempYPointList[i][j];
          }
        }
      }
    }

    //再矫正右半边
    for (var i = xCenter; i < xCount; i++) {
      oldY = y = yPointList[i][0] / scanKY;

      if ((y2Factor != 1) && (oldY != 0)) {
        topX = atan(xMin / (sqrt(pow(scanHigh, 2) + pow(oldY, 2)) + scanDis)) *
            (pXMax / angle) /
            scanKX;
        topY = atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
        pX = 0;
        pY = y2Factor * 0.99 * topY;
        A = fabs(pY);
        B = fabs(A * topX / sqrt(topY * topY - A * A));
      }

      //右半边, 一行一行
      for (var j = 0; j < yCount; j++) {
        tempXPointList[i][j] = (xPointList[i][j] / scanKY);
        tempYPointList[i][j] = (yPointList[i][j] / scanKY);

        if (j < yCenter) {
          //右上角
          if (xFactor != 1) {
            tempXPointList[i][j] = atan(tempXPointList[i][j] /
                    (sqrt(pow(scanHigh, 2) +
                            pow(oldY, 2) * (1 - xFactor) * 32) +
                        scanDis)) *
                (pXMax / angle) /
                scanKY;
            tempYPointList[i][j] =
                atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
          }
        } else {
          //右下角
          if (x2Factor != 1) {
            tempXPointList[i][j] = atan(tempXPointList[i][j] /
                    (sqrt(pow(scanHigh, 2) +
                            pow(oldY, 2) * (1 - x2Factor) * 32) +
                        scanDis)) *
                (pXMax / angle) /
                scanKX;
            tempYPointList[i][j] =
                atan(oldY / scanHigh) * (pYMax / angle) / scanKY;
          }
        }

        if ((y2Factor != 1) && (oldY != 0)) {
          tempYPointList[i][j] =
              A * sqrt(1 + pow(tempXPointList[i][j], 2) / pow(B, 2));
          if (oldY < 0) {
            tempYPointList[i][j] = -tempYPointList[i][j];
          }
        }
      }
    }

    // log
    const radius = 10.0;
    const scale = 0.025;
    const offsetWidth = 100.0; //宽度额外增加的量
    const offsetHeight = 100.0; //高度额外增加的量
    const offsetX = offsetWidth / 2; //宽度偏移后x绘制的偏移量
    const offsetY = offsetHeight / 2; //高度偏移后y绘制的偏移量
    final image = drawImageSync(
        Size((pXMax - pXMin) * scale + offsetWidth,
            (pYMax - pYMin) * scale + offsetHeight), (canvas) async {
      final paint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.fill;
      //debugger();
      //--原始数据
      for (var i = 0; i < xCount; i++) {
        for (var j = 0; j < yCount; j++) {
          canvas.drawCircle(
            Offset((xPointList[i][j] - pXMin) * scale + offsetX,
                (yPointList[i][j] - pYMin) * scale + offsetY),
            radius,
            paint,
          );
        }
      }
      //将矫正数据作用到原始点坐标中
      for (var i = 0; i < xCount; i++) {
        for (var j = 0; j < yCount; j++) {
          xPointList[i][j] =
              max(pXMin, min(pXMax, tempXPointList[j][i] * scanKX));
          yPointList[i][j] =
              max(pYMin, min(pYMax, tempYPointList[j][i] * scanKY));

          if (rotateAngle != 0) {
            //旋转的角度
            final a = rotateAngle.hd;
            final anchor = Offset(pXCenter, pYCenter);
            final dx = xPointList[i][j] - anchor.dx;
            final dy = yPointList[i][j] - anchor.dy;
            final rotateX = anchor.dx + dx * cos(a) - dy * sin(a);
            final rotateY = anchor.dy + dx * sin(a) + dy * cos(a);

            xPointList[i][j] = rotateX;
            yPointList[i][j] = rotateY;
          }
        }
      }
      //--矫正后的数据
      paint.color = Colors.redAccent;
      StringBuffer buffer = StringBuffer();
      for (var j = 0; j < yCount; j++) {
        for (var i = 0; i < xCount; i++) {
          //result
          result.add(Offset(xPointList[i][j], yPointList[i][j]));
          //image
          canvas.drawCircle(
            Offset((xPointList[i][j] - pXMin) * scale + offsetX,
                (yPointList[i][j] - pYMin) * scale + offsetY),
            radius,
            paint,
          );
          //log
          buffer.write("${xPointList[i][j].toInt()},${yPointList[i][j].toInt()}"
              .padRight(15));
        }
        buffer.writeln();
      }

      //日志
      (await cacheFilePath("${logName ?? "point_list_$xFactor"}.log", "adjust"))
          .file()
          .writeString(buffer.toString());
    });

    await image.saveToFile((await cacheFilePath(
            "${logName ?? "point_list_$xFactor"}.png", "adjust"))
        .file());

    //output
    outputLogImage = image;

    return result;
  }

  /// 发送数据
  Future send(List<Offset> list) async {
    final bytes = bytesWriter((writer) {
      for (var i = 0; i < list.length; i++) {
        final offset = list[i];
        final x = ((offset.dx - pXMin) / 4).toInt();
        final y = ((offset.dy - pYMin) / 4).toInt();
        writer.writeInt(x, 2);
        writer.writeInt(y, 2);
      }
      //writer.writeInt(value)
    });

    //先退出
    final deviceId = $operateDeviceId;
    var resultList = await $deviceManager.sendDeviceRequest(ExitRequest(),
        deviceId: deviceId);

    //选择光源
    resultList = await $deviceManager.sendDeviceRequest(
        FactoryRequest(
          FactoryState.previewPowerSetting,
          pwr: 100,
          laserType: LightType.blue.value,
        ),
        deviceId: deviceId);

    //再次退出
    resultList = await $deviceManager.sendDeviceRequest(ExitRequest(),
        deviceId: deviceId);

    //数据模式
    resultList = await $deviceManager.sendDeviceRequest(
        DataModeRequest.dataMode(bytes.size()),
        deviceId: deviceId);

    //发送数据
    final index = generateEngraveIndex();
    resultList = await $deviceManager.sendDeviceRequest(
        DataRequest.index(bytes, index, name: "$index"),
        deviceId: deviceId);

    //完成矫正
    resultList = await $deviceManager.sendDeviceRequest(
        FactoryRequest(FactoryState.finishAdjustData, index: index),
        deviceId: deviceId);

    l.d(resultList);
  }
}
