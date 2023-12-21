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

class _UserInfoPageState extends State<UserInfoPage> {
  late UserModel userModel;

  @override
  void initState() {
    userModel = context.getViewModel();
    super.initState();
  }

  WidgetList _buildUserInfoTile(BuildContext context, UserBean? userBean) {
    var globalConfig = GlobalConfig.of(context);
    var userBean = userModel.userBeanData.value;
    return [
      SingleLabelInfoTile(
        labelWidget: CircleNetworkImage(url: userBean?.avatar),
        onTap: () {
          //todo
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
        onTap: () {
          //todo
        },
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "账号",
        info: userBean?.email ?? userBean?.mobile,
      ).rItemTile(),
      SingleLabelInfoTile(
        label: "所在地区",
        info: join(
          " ",
          userBean?.region,
          userBean?.province,
          userBean?.city,
        ),
        onTap: () {
          //todo
        },
      ).rItemTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
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
      body: userModel.userBeanData.listener((context, liveData, error) {
        return RScrollView(
          children: _buildUserInfoTile(context, liveData),
        );
      }),
    );
  }
}
