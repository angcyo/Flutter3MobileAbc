import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/03/06
///

/// 颜色通道
/// [ui.ImageByteFormat.rawRgba]
/// [PixelFormat.rgba8888]
enum ImageColorChannel {
  R,
  G,
  B,
  A,
}

class ImageAbc extends StatefulWidget {
  const ImageAbc({super.key});

  @override
  State<ImageAbc> createState() => _ImageAbcState();
}

class _ImageAbcState extends State<ImageAbc> with BaseAbcStateMixin {
  /// 当前选择的图片
  ImageMeta? selectedImageMeta;

  /// 操作处理后的图片
  ImageMeta? resultImageMeta;

  /// 耗时
  String? costTime;

  @override
  List<Widget> buildBodyList(BuildContext context) {
    final size = Size(double.infinity, min(screenWidth, screenHeight));
    return [
      [
        /*ColoredBox(
          color: Colors.black12,
        ),*/
        Container(
          width: size.width,
          height: size.height,
          color: Colors.black12,
        ),
        /*paintWidget((canvas, size) {
          canvas.drawRect(
              Offset.zero & size,
              Paint()
                ..color = Colors.black12
                ..style = PaintingStyle.fill);
        }, size: size),*/
        if (selectedImageMeta != null) selectedImageMeta!.toImageWidget(),
        if (selectedImageMeta == null)
          "点击选择图片".text(textAlign: TextAlign.center)
      ]
          .stack(alignment: Alignment.center)!
          .constrainedMin(minWidth: size.width, minHeight: size.height)
          .click(() {
        //toastInfo("选择图片");
        pickSingleImage().then((value) {
          if (value != null) {
            value.path?.toImageMetaFromFile().then((value) {
              setState(() {
                selectedImageMeta = value;
              });
            });
          }
        });
      }),
      //---
      [
        GradientButton(
            onTap: () async {
              lTime.tick();
              resultImageMeta =
                  await extractChannel(selectedImageMeta, ImageColorChannel.A);
              costTime = lTime.time();
              updateState();
            },
            child: "提取A通道".text()),
        GradientButton(
            onTap: () async {
              lTime.tick();
              resultImageMeta =
                  await extractChannel(selectedImageMeta, ImageColorChannel.R);
              costTime = lTime.time();
              updateState();
            },
            child: "提取R通道".text()),
        GradientButton(
            onTap: () async {
              lTime.tick();
              resultImageMeta =
                  await extractChannel(selectedImageMeta, ImageColorChannel.G);
              costTime = lTime.time();
              updateState();
            },
            child: "提取G通道".text()),
        GradientButton(
            onTap: () async {
              lTime.tick();
              resultImageMeta =
                  await extractChannel(selectedImageMeta, ImageColorChannel.B);
              costTime = lTime.time();
              updateState();
            },
            child: "提取B通道".text()),
        GradientButton(
            onTap: () async {
              lTime.tick();
              resultImageMeta = await greyHandle(selectedImageMeta);
              costTime = lTime.time();
              updateState();
            },
            child: "灰度处理".text()),
        GradientButton(
            onTap: () async {
              lTime.tick();
              /*resultImageMeta = await io(selectedImageMeta,
                  (message) async => await bwHandle(message));*/
              resultImageMeta = await bwHandle(selectedImageMeta);
              costTime = lTime.time();
              updateState();
            },
            child: "黑白处理".text()),
      ].wrap()!,
      buildInfo(),
      if (resultImageMeta != null) resultImageMeta!.toImageWidget()
    ];
  }

  Widget buildInfo() {
    return textSpanBuilder((builder) {
      builder.addText("选择图片: ");
      selectedImageMeta?.let((it) {
        builder.addTextStyle(
          "${it.width}x${it.height} ${it.pixelsFormat} ",
          color: Colors.red,
        );
        builder.addText(it.bytes?.length.toSizeStr());
      });
      //---
      builder.addText("\n处理后: ");
      resultImageMeta?.let((it) {
        builder.addTextStyle(
          "${it.width}x${it.height}=${it.width * it.height} ",
          color: Colors.red,
        );
        it.pixels?.lengthInBytes.let((length) {
          builder.addText("pixels:${length.toSizeStr()}");
        });
      });
      //--
      costTime?.let((it) => builder.addText("\n耗时: $it"));
    });
  }

  /// 提取颜色通道
  Future<ImageMeta?> extractChannel(
      ImageMeta? imageMeta, ImageColorChannel channel) async {
    final pixels = imageMeta?.pixels;
    if (imageMeta == null || pixels == null) {
      return null;
    }
    int width = imageMeta.width;
    int height = imageMeta.height;
    final resultPixels = Uint8List(pixels.lengthInBytes);
    for (var i = 0; i < pixels.lengthInBytes; i += 4) {
      switch (channel) {
        case ImageColorChannel.R:
          resultPixels[i] = pixels[i];
          resultPixels[i + 1] = 0;
          resultPixels[i + 2] = 0;
          resultPixels[i + 3] = 255;
          break;
        case ImageColorChannel.G:
          resultPixels[i] = 0;
          resultPixels[i + 1] = pixels[i + 1];
          resultPixels[i + 2] = 0;
          resultPixels[i + 3] = 255;
          break;
        case ImageColorChannel.B:
          resultPixels[i] = 0;
          resultPixels[i + 1] = 0;
          resultPixels[i + 2] = pixels[i + 2];
          resultPixels[i + 3] = 255;
          break;
        case ImageColorChannel.A:
          resultPixels[i] = 0;
          resultPixels[i + 1] = 0;
          resultPixels[i + 2] = 0;
          resultPixels[i + 3] = pixels[i + 3];
          break;
      }
    }
    final image = await resultPixels.toImageFromPixels(width, height);
    //final base64 = await image.toBase64();
    return ImageMeta(image, null, resultPixels);
  }

  /// 灰度
  Future<ImageMeta?> greyHandle(ImageMeta? imageMeta) async {
    final pixels = imageMeta?.pixels;
    if (imageMeta == null || pixels == null) {
      return null;
    }
    int width = imageMeta.width;
    int height = imageMeta.height;
    final resultPixels = Uint8List(pixels.lengthInBytes);
    for (var i = 0; i < pixels.lengthInBytes; i += 4) {
      final r = pixels[i];
      final g = pixels[i + 1];
      final b = pixels[i + 2];
      final grey = (r + g + b) ~/ 3;
      //print(grey);
      resultPixels[i] = grey;
      resultPixels[i + 1] = grey;
      resultPixels[i + 2] = grey;
      resultPixels[i + 3] = pixels[i + 3];
    }
    final image = await resultPixels.toImageFromPixels(width, height);
    //final base64 = await image.toBase64();
    return ImageMeta(image, null, resultPixels);
  }

  /// 黑白画
  Future<ImageMeta?> bwHandle(ImageMeta? imageMeta,
      [int threshold = 128]) async {
    final pixels = imageMeta?.pixels;
    if (imageMeta == null || pixels == null) {
      return null;
    }
    int width = imageMeta.width;
    int height = imageMeta.height;
    final resultPixels = Uint8List(pixels.lengthInBytes);
    for (var i = 0; i < pixels.lengthInBytes; i += 4) {
      final r = pixels[i];
      final g = pixels[i + 1];
      final b = pixels[i + 2];
      final grey = (r + g + b) ~/ 3;
      if (grey >= threshold) {
        resultPixels[i] = 255;
        resultPixels[i + 1] = 255;
        resultPixels[i + 2] = 255;
      } else {
        resultPixels[i] = 0;
        resultPixels[i + 1] = 0;
        resultPixels[i + 2] = 0;
      }
      resultPixels[i + 3] = pixels[i + 3];
    }
    final image = await resultPixels.toImageFromPixels(width, height);
    //final base64 = await image.toBase64();
    return ImageMeta(image, null, resultPixels);
  }
}
