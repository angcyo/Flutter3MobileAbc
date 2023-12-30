import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/assets_generated/assets.gen.dart';
import 'package:laser_pecker/laser_pecker.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/12/12
///

class LikeTipDialog extends StatelessWidget {
  const LikeTipDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return [
      LPS
          .of(context)
          .like
          .text(
            style: globalTheme.textTitleStyle
                .copyWith(fontWeight: FontWeight.bold),
          )
          .paddingAll(kX),
      Divider(
        height: 1,
        color: globalTheme.lineColor,
      ),
      Empty.height(kX),
      [
        lpSvgWidget(Assets.svg.noteCountIco),
        "当前发布笔记数".text(style: globalTheme.textSubStyle).padding(kH, 0),
        "4".text(style: globalTheme.textBodyStyle),
      ]
          .row(
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .padding(0, kX),
      [
        lpSvgWidget(Assets.svg.likeCountIco),
        "当前获得点赞数".text(style: globalTheme.textSubStyle).padding(kH, 0),
        "2".text(style: globalTheme.textBodyStyle),
      ]
          .row(
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .padding(0, kX),
      [
        lpSvgWidget(Assets.svg.collectCountIco),
        "当前获得收藏数".text(style: globalTheme.textSubStyle).padding(kH, 0),
        "3".text(style: globalTheme.textBodyStyle),
      ]
          .row(
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .padding(0, kX),
      Empty.height(kX),
      GradientButton(
        color: globalTheme.icoGrayColor,
        minWidth: 150,
        radius: kDefaultBorderRadiusXX,
        onTap: () {
          context.pop();
        },
        child: LPS.of(context).iKnown.text(),
      ).paddingAll(kX),
    ]
        .column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min)!
        .container(
            decoration: BoxDecoration(
              color: globalTheme.themeWhiteColor,
              borderRadius: BorderRadius.circular(kDefaultBorderRadiusXX),
            ),
            margin: const EdgeInsets.all(70))
        .wrapContent();
  }
}
