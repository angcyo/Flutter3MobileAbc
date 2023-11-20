part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _homeAppBar(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return [
      loadAssetSvgWidget(
        Assets.svg.defaultAvatar,
        package: "laser_pecker",
      )
          .circleShadow(
            clipContent: false,
            padding: EdgeInsets.all(globalTheme.m),
            width: 32,
            height: 32,
          )
          .paddingSymmetric(horizontal: globalTheme.xh),
      Text(LPS.of(context).clickConnectDeviceLabel)
          .paddingSymmetric(horizontal: globalTheme.h)
          .ink(onTap: () {})
          .wrapContent()
          .expanded(),
      loadAssetSvgWidget(
        Assets.svg.addDevice,
        package: "laser_pecker",
      ).paddingAll(globalTheme.xh).inkCircle(onTap: () {
        toastMessage("添加设备".text());
      }),
    ].row().paddingSymmetric(vertical: globalTheme.xh).safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeAppBar(context),
    );
  }
}
