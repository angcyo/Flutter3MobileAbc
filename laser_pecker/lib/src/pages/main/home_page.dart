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
      ).container(
        padding: EdgeInsets.all(globalTheme.m),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        width: 32,
        height: 32,
      ),
      Text(LPS.of(context).clickConnectDeviceLabel)
          .paddingSymmetric(horizontal: globalTheme.h)
          .expanded(),
    ].row().paddingSymmetric(horizontal: globalTheme.xh).safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeAppBar(context),
    );
  }
}
