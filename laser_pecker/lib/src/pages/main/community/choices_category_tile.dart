import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../../models/bean/choices_category_bean.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2024/01/02
///
/// 精选/分类tile
class ChoicesCategoryTile extends StatelessWidget {
  final ChoicesCategoryBean? bean;

  const ChoicesCategoryTile({super.key, this.bean});

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return [
      bean?.picture?.toImageWidget().clipOval(),
      bean?.name
          ?.text(
              textAlign: TextAlign.center,
              style: globalTheme.textBodyStyle
                  .copyWith(fontWeight: FontWeight.bold))
          .paddingAll(kL),
    ].column()!;
  }
}
