import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_code/flutter3_code.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/06/11
///
class CodeAbc extends StatefulWidget {
  const CodeAbc({super.key});

  @override
  State<CodeAbc> createState() => _CodeAbcState();
}

class _CodeAbcState extends State<CodeAbc> with BaseAbcStateMixin {
  late final codeDataConfig = TextFieldConfig(
    text: "lastCodeData".hiveGet<String>(),
    hintText: "请输入二维码内容",
    onChanged: (text) {
      "lastCodeData".hivePut(text);
    },
  );

  UiImage? qrcodeImage;

  dynamic codeError;

  /// 转换时长
  String duration = "";

  final width2d = 300;
  final height2d = 300;
  final height1d = 100;
  final bgColor = Colors.black12;
  final fgColor = Colors.black;

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      codeDataConfig.toTextField(maxLines: 3).paddingCss(kX, kX, kX, 0),
      [
        GradientButton.normal(
          () {
            lTime.tick();
            codeDataConfig.text
                .toCodeImage(
              width2d,
              height2d,
              Barcode.qrCode(
                errorCorrectLevel: BarcodeQRCorrectionLevel.high,
              ),
              bgColor: bgColor,
              fgColor: fgColor,
            )
                .getValue((value, error) {
              duration = lTime.time();
              codeError = error;
              qrcodeImage = value;
              updateState();
            });
          },
          child: "生成qrCode".text(),
        ),
        GradientButton.normal(
          () async {
            lTime.tick();
            codeDataConfig.text
                .toCodeImage(
              width2d,
              height1d,
              Barcode.code128(),
              bgColor: bgColor,
              fgColor: fgColor,
            )
                .getValue((value, error) {
              duration = lTime.time();
              codeError = error;
              qrcodeImage = value;
              updateState();
            });
          },
          child: "生成code128".text(),
        ),
        GradientButton.normal(
          () {
            lTime.tick();
            codeDataConfig.text
                .toCodeImage(
              width2d,
              height2d,
              Barcode.dataMatrix(),
              bgColor: bgColor,
              fgColor: fgColor,
            )
                .getValue((value, error) {
              duration = lTime.time();
              codeError = error;
              qrcodeImage = value;
              updateState();
            });
          },
          child: "生成dataMatrix".text(),
        ),
        GradientButton.normal(
          () {
            lTime.tick();
            codeDataConfig.text
                .toCodeImage(
              width2d,
              height2d,
              Barcode.aztec(),
              bgColor: bgColor,
              fgColor: fgColor,
            )
                .getValue((value, error) {
              duration = lTime.time();
              codeError = error;
              qrcodeImage = value;
              updateState();
            });
          },
          child: "生成aztec".text(),
        ),
      ].wrap()?.paddingCss(kX, kX, kX, 0),
      [
        "${qrcodeImage?.width}*${qrcodeImage?.height} $codeError\n耗时:$duration"
            .text(
          fontSize: 8,
          textColor: Colors.red,
          fontWeight: FontWeight.bold,
        ) /*.position(top: 0, left: 0)*/,
        qrcodeImage?.toImageWidget().center().hero(qrcodeImage).click(() {
          context.showWidgetDialog(SinglePhotoDialog(
            content: qrcodeImage,
          ));
          /*context.pushWidget(SinglePhotoDialog(
            content: qrcodeImage,
          ).material(
            color: Colors.white,
            */ /*surfaceTintColor: Colors.redAccent,*/ /*
          ));*/
        }),
      ].stack()?.paddingCss(kX, kX, kX, 0),
    ].filterNull();
  }
}
