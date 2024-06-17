import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter3_fonts/flutter3_fonts.dart';

import '../main_route.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/06/15
///
class FontAbc extends StatefulWidget {
  const FontAbc({super.key});

  @override
  State<FontAbc> createState() => _FontAbcState();
}

class _FontAbcState extends State<FontAbc> with BaseAbcStateMixin {
  List<String> systemFontPath = $fontsManager.systemFontPath;
  List<FontFamilyMeta>? _fontFamilyMetas;

  /// 加载系统字体路径
  /// [path]
  Future<List<String>?> _loadFilePathList(String path) async {
    // "/System/Library/Fonts/"
    //val systemFontPath = listOf("/system/fonts", "/system/font", "/data/fonts")
    final files = await path.file().listFiles();
    return files?.map((e) => e.path).toList();
  }

  @override
  WidgetList buildBodyList(BuildContext context) {
    return [
      [
        GradientButton.normal(() {
          const fileName = "Roboto-MediumItalic.ttf";
          l.d(FontFamilyVariantMeta.fromFilename(fileName));
        }, child: "test".text()),
      ].flowLayout(childGap: kH, padding: const EdgeInsets.all(kH))!,
      [
        for (final path in systemFontPath)
          GradientButton.normal(() {
            $fontsManager.loadFileFontFamilyList(path).get((value, error) {
              if (value is List<FontFamilyMeta>) {
                _fontFamilyMetas = value;
                updateState();
              }
            });
          }, child: path.text()),
      ].flowLayout(childGap: kH, padding: const EdgeInsets.all(kH))!,
      "SystemFonts↓".text(textAlign: TextAlign.center),
      if (!isNil(_fontFamilyMetas))
        ..._fontFamilyMetas!.map((e) => FontFamilyTile(e)),
      "GoogleFonts↓".text(textAlign: TextAlign.center),
      ...[
        for (final font in GoogleFonts.asMap().entries.take(20))
          font.key
              .text(style: GoogleFonts.getFont(font.key))
              .paddingAll(kX)
              .ink(() {
            l.d("点击了:$font");
          }),
      ]
    ];
  }
}
