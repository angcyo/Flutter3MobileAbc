import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/assets_generated/assets.gen.dart';
import 'package:laser_pecker/laser_pecker.dart';
import 'package:laser_pecker/src/pages/main/mine/user_mixin.dart';

import '../../../models/bean/dynamic_bean.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2024/01/02
///
class DynamicTile extends StatelessWidget {
  final DynamicBean? bean;

  const DynamicTile({super.key, this.bean});

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    final images = bean?.mainImage?.fromJsonList<String>();
    return [
      _DynamicUser(bean: bean),
      bean?.title
          ?.toRichReadMore(textStyle: globalTheme.textBodyStyle)
          .container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: kX),
          ),
      images
          ?.nineGrid(
            padding: const EdgeInsets.all(kX),
          )
          .matchParent(matchHeight: false),
      _DynamicNumberBar(bean: bean),
    ].column()!;
  }
}

class _DynamicUser extends StatelessWidget with UserOperateMixin {
  final double avatarSize = 35;
  final DynamicBean? bean;

  _DynamicUser({super.key, this.bean});

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return [
      bean?.avatar
          ?.toImageWidget(memCacheWidth: avatarSize.toInt())
          .size(width: avatarSize, height: avatarSize)
          .circleShadow()
          .paddingAll(kX),
      [
        bean?.nickname?.text(style: globalTheme.textBodyStyle),
        bean?.releaseTime?.toTimeAgo().text(style: globalTheme.textDesStyle)
      ]
          .column(
            crossAxisAlignment: CrossAxisAlignment.start,
          )!
          .expanded(),
      isAttentionRequest.listener((context) {
        //debugger();
        final isFollow = bean?.isFollow == true;
        if (isAttentionRequest.dataOnce != null) {
          bean?.isFollow = !isFollow;
        }
        return buildAttentionUserWidget(
          context,
          bean?.isFollow == true,
          bean?.userId,
          borderColor: globalTheme.textBodyStyle.color,
          textStyle: globalTheme.textBodyStyle,
        );
      }),
      IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: () {
            toastBlur(text: "更多");
          },
          icon: Icon(
            Icons.more_horiz,
            color: globalTheme.textBodyStyle.color,
          )),
    ].row(mainAxisAlignment: MainAxisAlignment.center)!;
  }
}

class _DynamicNumberBar extends StatelessWidget {
  final DynamicBean? bean;

  const _DynamicNumberBar({super.key, this.bean});

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    final tintColor = globalTheme.textBodyStyle.color;
    return [
      [
        lpSvgWidget(
            bean?.isLike == true
                ? Assets.svg.likeCountFillIco
                : Assets.svg.likeCountIco,
            tintColor: tintColor),
        bean?.likeNumber?.text().paddingAll(kM)
      ]
          .row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .paddingAll(kM)
          .ink(onTap: () {
        toastBlur(text: "喜欢");
      }).expanded(),
      [
        lpSvgWidget(
            bean?.isDownload == true
                ? Assets.svg.collectCountFillIco
                : Assets.svg.collectCountIco,
            tintColor: tintColor),
        bean?.downloadNumber?.text().paddingAll(kM)
      ]
          .row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .paddingAll(kM)
          .expanded()
          .ink(onTap: () {
        toastBlur(text: "下载");
      }).expanded(),
      [
        lpSvgWidget(
            bean?.isComment == true
                ? Assets.svg.commentCountFillIco
                : Assets.svg.commentCountIco,
            tintColor: tintColor),
        bean?.commentNumber?.text().paddingAll(kM)
      ]
          .row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
          )!
          .paddingAll(kM)
          .ink(onTap: () {
        toastBlur(text: "评论");
      }).expanded(),
    ].row()!;
  }
}
