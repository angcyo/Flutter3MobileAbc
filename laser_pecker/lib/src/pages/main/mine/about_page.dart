import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/21
///
/// 关于界面
class AboutPage extends StatelessWidget with AbsScrollPage, LpScrollPageMixin {
  const AboutPage({super.key});

  @override
  String? getTitle(BuildContext context) => "关于";

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    return buildScaffold(context, children: [
      Empty.height(kXxh),
      SingleLabelInfoTile(
        label: "品牌介绍",
        onTap: () {},
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "社区规范",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "服务条款",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "隐私政策",
        onTap: () {},
      ).rItemTile(),
      Builder(builder: (context) {
        return SingleLabelInfoTile(
          label: "APP版本",
          infoWidget: packageInfo.toWidget((value) =>
              "当前版本:V${value?.version}${isDebug ? "(${value?.buildNumber})" : ""}"
                  .text(style: globalConfig.globalTheme.textDesStyle)),
          onTap: () {},
        );
      }).rItemTile(),
    ]);
  }
}
