import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../../../laser_pecker.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/21
///
/// 账号安全界面
class AccountSecurityPage extends StatelessWidget
    with AbsScrollPage, LpScrollPageMixin {
  const AccountSecurityPage({super.key});

  @override
  String? getTitle(BuildContext context) => "账号与安全";

  @override
  Widget build(BuildContext context) {
    final globalConfig = GlobalConfig.of(context);
    UserModel? userModel = context.getViewModel();
    final userBean = userModel.userBeanData.value;
    return buildScaffold(context, children: [
      Empty.height(kXxh),
      SingleLabelInfoTile(
        label: "账号",
        info: userBean?.email ?? userBean?.mobile,
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "修改登录密码",
        onTap: () {
          context.pushWidget(const AccountSecurityPage());
        },
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "雕刻密码",
        onTap: () {},
      ).rItemTile(),
      Empty.height(kXh),
      const TextTile(
        text: "绑定信息",
      ),
      SingleLabelInfoTile(
        label: "手机号",
        onTap: () {},
      ).rDecoration(
        part: true,
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding: edgeInsets(kXh, 0, kXh, 0),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "邮箱",
        onTap: () {},
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "Apple账号",
        onTap: () {},
      ).rItemTile(),
      Empty.height(kXxh),
      FillButton(
        text: "注销账号",
        minHeight: 44,
        textColor: globalConfig.globalTheme.errorColor,
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        onTap: () async {
          /*var confirm = await showDialogWidget(
                  context: context,
                  widget: IosNormalDialog(
                    title: "退出账号",
                    message: "确定要退出当前账号吗?",
                    cancel: "取消",
                    confirm: "确定",
                    onConfirmTap: () async {
                      userModel.logout(context);
                      return false;
                    },
                  ));
              l.i(confirm);*/
        },
      ).paddingSymmetric(vertical: kXh, horizontal: kXh)
    ]);
  }
}
