part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/14
///

class UserSettingPage extends StatelessWidget {
  const UserSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    UserModel? userModel = context.getViewModel();
    return Scaffold(
      appBar: globalConfig.appBarBuilder(
        context,
        this,
        elevation: 0,
        title: "个人信息".text(style: globalConfig.globalTheme.textTitleStyle),
        flexibleSpace: linearGradientWidget(
            listOf(globalConfig.globalTheme.themeWhiteColor)),
      ),
      backgroundColor: globalConfig.globalTheme.whiteSubBgColor,
      body: RScrollView(
        children: [
          Column(
            children: [
              lpImageWidget(Assets.png.aboutLogo.keyName,
                  width: 70, height: 70),
              packageInfo
                  .toWidget((value) =>
                      "当前版本:V${value?.version}${isDebug ? "(${value?.buildNumber})" : ""}"
                          .text(style: globalConfig.globalTheme.textDesStyle))
                  .padding(kX, kX),
            ],
          ).padding(kX, kXxh, 0, kX),
          SingleLabelInfoTile(
            label: "个人资料",
            onTap: () {},
          ).rDecoration(
            fillColor: globalConfig.globalTheme.themeWhiteColor,
            sliverPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
            bottomLineColor: globalConfig.globalTheme.lineColor,
            bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
          ),
          SingleLabelInfoTile(
            label: "账号与安全",
            onTap: () {},
          ).rItemTile(),
          SingleLabelInfoTile(
            label: "关于",
            onTap: () {},
          ).rDecoration(
            part: true,
            fillColor: globalConfig.globalTheme.themeWhiteColor,
            sliverPadding:
                const EdgeInsets.symmetric(vertical: kXh, horizontal: kXh),
            bottomLineColor: globalConfig.globalTheme.lineColor,
            bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
          ),
          SingleLabelInfoTile(
            label: "联系我们",
            onTap: () {},
          ).rItemTile(),
          Empty.height(kXxh),
          FillButton(
            text: "退出账号",
            minHeight: 44,
            textColor: globalConfig.globalTheme.errorColor,
            fillColor: globalConfig.globalTheme.themeWhiteColor,
            onTap: () {},
          ).paddingSymmetric(vertical: kXh, horizontal: kXh)
        ],
      ),
    );
  }
}
