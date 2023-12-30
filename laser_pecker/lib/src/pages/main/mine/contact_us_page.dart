import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../../../laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/21
///
/// 联系我们页面
class ContactUSPage extends StatelessWidget
    with AbsScrollPage, LpScrollPageMixin {
  const ContactUSPage({super.key});

  @override
  String? getTitle(BuildContext context) => "联系我们";

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    return buildScaffold(context, children: [
      Empty.height(kXxh),
      SingleLabelInfoTile(
        label: "邮箱",
        des: "angcyo@126.com",
        onTap: () {},
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "公众号",
        des: "angcyo",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "公司电话",
        des: "0571-88888888",
        onTap: () {},
      ).rItemTile(),
      Empty.height(kXh),
      SingleLabelInfoTile(
        label: "instagram",
        des: "https://www.instagram.com/laserpecker/",
        onTap: () {},
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "Youtube",
        des: "https://www.youtube.com/channel/",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "Facebook",
        des: "https://www.facebook.com/LaserPecker-2-106452314611308",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "Facebook群组",
        des: "https://www.facebook.com/groups/laserpecker2",
        onTap: () {},
      ).rItemTile(),
    ]);
  }
}
