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
      lpSvgWidget(
        Assets.svg.defaultAvatar,
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
          .inkWell(onTap: () {})
          .wrapContent()
          .expanded(),
      lpSvgWidget(
        Assets.svg.addDevice,
      ).paddingAll(globalTheme.xh).inkWellCircle(onTap: () {
        toastMessage("添加设备".text());
      }),
    ].row().paddingSymmetric(vertical: globalTheme.x).safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        _homeAppBar(context),
        [
          lpImageWidget(Assets.png.defaultBanner.keyName, fit: BoxFit.cover)
              .ratio(358 / 112)
              .clipRadius()
              .paddingSymmetric(horizontal: kXh),
          _HomeGridWidget(
                  svgKey: Assets.svg.homeCreation,
                  label: LPS.of(context).creation,
                  onTap: () {})
              .rGridTile(2,
                  childAspectRatio: 0.85,
                  mainAxisSpacing: kXh,
                  crossAxisSpacing: kXh),
          _HomeGridWidget(
                  svgKey: Assets.svg.homeCamera,
                  label: LPS.of(context).camera,
                  onTap: () {})
              .rGridTile(2),
          _HomeGridWidget(
                  svgKey: Assets.svg.homeAlbum,
                  label: LPS.of(context).album,
                  onTap: () {})
              .rGridTile(2),
          _HomeGridWidget(
                  svgKey: Assets.svg.homeMaterial,
                  label: LPS.of(context).material,
                  onTap: () {})
              .rGridTile(2),
          [
            if (isDebug)
              defaultTargetPlatform
                  .text(
                    textAlign: TextAlign.center,
                  )
                  .container(alignment: Alignment.bottomCenter)
                  .expanded(),
            Empty.height(kBottomNavigationBarCoverHeight)
          ].column().rFill(),
        ].rScroll().expanded(),
      ].column(),
    );
  }
}

class _HomeGridWidget extends StatelessWidget {
  final String svgKey;
  final String label;
  final GestureTapCallback onTap;

  const _HomeGridWidget({
    super.key,
    required this.svgKey,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return lpSvgWidget(svgKey)
        .container(
          padding: const EdgeInsets.all(16),
          decoration: radiusFillDecoration(context: context),
        )
        .columnOf(Text(label).paddingAll(globalTheme.h))
        .inkRadius(
          onTap: onTap,
          backgroundColor: "#F6F6F6".toColor(),
        );
  }
}
