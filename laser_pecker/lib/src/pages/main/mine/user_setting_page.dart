part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/14
///
/// 用户设置界面
class UserSettingPage extends StatelessWidget
    with AbsScrollPage, LpScrollPageMixin {
  const UserSettingPage({super.key});

  @override
  String? getTitle(BuildContext context) => "设置";

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    UserModel? userModel = context.getViewModel();
    return buildScaffold(context, children: [
      Column(
        children: [
          lpImageWidget(Assets.png.aboutLogo.keyName, width: 70, height: 70),
          packageInfo
              .toWidget((value) =>
                  "当前版本:V${value?.version}${isDebug ? "(${value?.buildNumber})" : ""}"
                      .text(style: globalConfig.globalTheme.textDesStyle))
              .padding(kX, kX),
        ].filterNull(),
      ).padding(kX, kXxh, 0, kX),
      SingleLabelInfoTile(
        label: "个人资料",
        onTap: () {
          context.pushWidget(const UserInfoPage());
        },
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "账号与安全",
        onTap: () {
          context.pushWidget(const AccountSecurityPage());
        },
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "关于",
        onTap: () {
          context.pushWidget(const AboutPage());
        },
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
        onTap: () {
          context.pushWidget(const ContactUSPage());
        },
      ).rItemTile(),
      Empty.height(kXxh),
      FillButton(
        text: "退出账号",
        minHeight: 44,
        textColor: globalConfig.globalTheme.errorColor,
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        onTap: () async {
          var confirm = await showDialogWidget(
              context: context,
              widget: IosNormalDialog(
                title: "退出账号",
                message: "确定要退出当前账号吗?",
                cancel: "取消",
                confirm: "确定",
                onConfirmTap: (_) async {
                  userModel.logout(context);
                  return false;
                },
              ));
          l.i(confirm);
        },
      ).paddingSymmetric(vertical: kXh, horizontal: kXh)
    ]);
  }
}
