import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/src/models/bean/list_user_bean.dart';

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

class _ListUserInfoTileState extends State<ListUserInfoTile> {
  @override
  Widget build(BuildContext context) {
    var bean = widget.listUserBean;
    var globalTheme = GlobalTheme.of(context);
    var avatar = CircleNetworkImage(
      url: bean.avatar,
      size: kAvatarSize,
    );
    var name = (bean.nickname ?? "--").text(
      style: globalTheme.textBodyStyle,
    );
    /*var signature = "".text(
      style: globalTheme.textDesStyle,
    );*/
    Widget action;
    if (widget.isFans) {
      if (bean.isFriend == 1) {
        action = StrokeButton(
          onTap: () {},
          text: "相互关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      } else {
        action = FillButton(
          onTap: () {},
          text: "回粉",
          textColor: globalTheme.textBodyStyle.color,
          fillColor: globalTheme.accentColor,
        );
      }
    } else {
      if (bean.isCancelAttention == true) {
        action = StrokeButton(
          onTap: () {},
          text: "关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      } else {
        action = StrokeButton(
          onTap: () {},
          text: "已关注",
          borderColor: globalTheme.textSubStyle.color,
        );
      }
    }
    //= GradientButton(onPressed: () {}, child: "已关注".text());
    return [
      avatar,
      [
        name, /*signature*/
      ]
          .column(crossAxisAlignment: CrossAxisAlignment.start)
          .padding(kH, 0)
          .expanded(),
      action
    ].row().padding(kX, kH);
  }
}
