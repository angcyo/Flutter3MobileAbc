part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/13
///

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage>
    with AbsScrollPage, LpScrollPageMixin {
  late UserModel userModel;

  @override
  void initState() {
    userModel = context.getViewModel();
    super.initState();
  }

  WidgetList _buildUserInfoTile(BuildContext context, UserBean? userBean) {
    var globalConfig = GlobalConfig.of(context);
    var userBean = userModel.userBeanData.value;
    var region = join(
      " ",
      userBean?.region,
      userBean?.province,
      userBean?.city,
    );
    return [
      SingleLabelInfoTile(
        labelWidget: CircleNetworkImage(url: userBean?.avatar)
            .hero(userBean?.avatar)
            .click(() {
          context.showPhotoPage(
              imageProvider: userBean?.avatar?.toCacheNetworkImageProvider());
        }),
        onTap: () {
          pickFiles(type: FileType.image).get((value, error) {
            if (value != null) {
              //debugger();
              userBean?.avatar = value.files.first.path;
              updateState();
              /*context.showPhotoPage(
                  imageProvider: value.files.first.path?.toFileImageProvider());*/
            }
          });
        },
      ).rDecoration(
        fillColor: globalConfig.globalTheme.themeWhiteColor,
        sliverPadding:
            const EdgeInsets.symmetric(vertical: kXxh, horizontal: kXh),
        bottomLineColor: globalConfig.globalTheme.lineColor,
        bottomLineMargin: const EdgeInsets.only(left: kX, right: kX),
      ),
      SingleLabelInfoTile(
        label: "昵称",
        info: userBean?.nickname,
        onTap: () async {
          await showDialogWidget(
              context: context,
              widget: SingleInputDialog(
                title: "修改昵称",
                hintText: "请输入昵称",
                text: userBean?.nickname,
                useIcon: false,
                onSaveTap: (text) async {
                  userBean?.nickname = text;
                  updateState();
                  return false;
                },
              ));
        },
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "账号",
        info: userBean?.email ?? userBean?.mobile,
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "所在地区",
        info: region,
        onTap: () async {
          await showDialogWidget(
              context: context,
              type: TranslationType.translationFade,
              widget: SingleInputDialog(
                title: "修改地区",
                hintText: "请输入地区",
                text: region,
                alignment: Alignment.bottomCenter,
                useIcon: true,
                onSaveTap: (text) async {
                  l.i(text);
                  return false;
                },
              ));
        },
      ).rItemTile(),
    ];
  }

  @override
  String? getTitle(BuildContext context) => "个人信息";

  @override
  Widget build(BuildContext context) {
    return userModel.userBeanData.listener((context, liveData, error) {
      return buildScaffold(context,
          children: _buildUserInfoTile(context, liveData));
    });
  }
}
