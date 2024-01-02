import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/src/models/bean/list_user_bean.dart';
import 'package:laser_pecker/src/pages/main/mine/user_mixin.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/12
///

class ListUserInfoTile extends StatefulWidget {
  /// 是否是粉丝界面
  final bool isFans;

  final ListUserBean listUserBean;

  const ListUserInfoTile({
    super.key,
    required this.listUserBean,
    required this.isFans,
  });

  @override
  State<ListUserInfoTile> createState() => _ListUserInfoTileState();
}

class _ListUserInfoTileState extends State<ListUserInfoTile>
    with UserOperateMixin {
  @override
  Widget build(BuildContext context) {
    final bean = widget.listUserBean;
    final globalTheme = GlobalTheme.of(context);
    final avatar = CircleNetworkImage(
      url: bean.avatar,
    );
    final name = (bean.nickname ?? "--").text(
      style: globalTheme.textBodyStyle,
    );
    final signature = "发帖:${bean.postsNumber} 粉丝:${bean.fansNumber}".text(
      style: globalTheme.textDesStyle,
    );
    Widget action;
    if (widget.isFans) {
      if (bean.isFriend == 1) {
        action = StrokeButton(
          onTap: () {
            attentionUser(bean.id, attention: false);
          },
          text: "相互关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      } else {
        action = FillButton(
          onTap: () {
            attentionUser(bean.id, attention: true);
          },
          text: "回粉",
          textColor: globalTheme.textBodyStyle.color,
          fillColor: globalTheme.accentColor,
        );
      }
    } else {
      if (bean.isCancelAttention == true) {
        action = StrokeButton(
          onTap: () {
            attentionUser(bean.id, attention: true);
          },
          text: "关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      } else {
        action = StrokeButton(
          onTap: () {
            attentionUser(bean.id, attention: false);
          },
          text: "已关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      }
    }
    //= GradientButton(onPressed: () {}, child: "已关注".text());
    return [
      avatar,
      [
        name,
        signature,
      ]
          .column(crossAxisAlignment: CrossAxisAlignment.start)!
          .padding(kH, 0)
          .expanded(),
      isAttentionRequest.loadingWidget(child: action),
    ].row()!.padding(kX, kH);
  }
}
