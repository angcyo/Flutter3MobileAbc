import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/app/image_picker_ex.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_code/flutter3_code.dart';
import 'package:flutter3_scanner/flutter3_scanner.dart';
import 'package:image_picker/image_picker.dart';

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

  XFile? selectFile;
  List<String>? scanResult;

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
        GradientButton.normal(
          () async {
            //debugger();
            context
                .pushWidget(const SingleCodeScannerPage(
              showScanWindow: true,
            ))
                .getValue((value, error) {
              scanResult = value as List<String>?;
              updateState();
            });
          },
          child: "扫码(小窗口)".text(),
        ),
        GradientButton.normal(
          () async {
            //debugger();
            context
                .pushWidget(const SingleCodeScannerPage(
              showScanWindow: false,
            ))
                .getValue((value, error) {
              scanResult = value as List<String>?;
              updateState();
            });
          },
          child: "扫码(全窗口)".text(),
        ),
        GradientButton.normal(
          () async {
            final file = await pickerImage();
            selectFile = file;
            if (file != null) {
              file.path.codeAnalyzeImageByPath().getValue((value, error) {
                scanResult = value;
                updateState();
              });
            }
          },
          child: "选图识别".text(),
        ),
        GradientButton.normal(
          () async {
            final file = await pickerImage(source: ImageSource.camera);
            selectFile = file;
            if (file != null) {
              file.path.codeAnalyzeImageByPath().getValue((value, error) {
                scanResult = value;
                updateState();
              });
            }
          },
          child: "拍照识别".text(),
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
      selectFile?.path.toString().text().paddingCss(kX, kX, kX, 0),
      scanResult
          ?.mapIndex((e, index) => "$index:$e")
          .toList()
          .join("\n")
          .text(selectable: true)
          .paddingCss(kX, kX, kX, 0),
    ].filterNull();
  }
}
