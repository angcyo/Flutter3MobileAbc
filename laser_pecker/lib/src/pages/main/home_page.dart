part of laser_pecker;

///
/// 首页
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 绘制渐变圆
  void _drawCircleGradient(Canvas canvas, Rect childRect, Rect parentRect) {
    var colors = ["#99FFFFFF".toColor(), "#33FFFFFF".toColor()];
    //var colors = [Colors.redAccent, Colors.yellowAccent];
    double radius = 80;
    void drawCircle(Rect circleRect) {
      //绘制一个渐变的圆
      canvas.drawCircle(
        circleRect.center,
        radius,
        Paint()
          ..shader = linearGradientShader(
            colors,
            from: circleRect.lt,
            to: circleRect.lb,
          ),
      );
    }

    Offset offset = const Offset(0, 100);
    //1:
    Rect circleRect = Rect.fromCircle(
      center: childRect.center + offset,
      radius: radius,
    );
    drawCircle(circleRect);
    //2:
    circleRect = Rect.fromCircle(
      center: childRect.center + offset + Offset(screenWidth / 2, 130),
      radius: radius,
    );
    drawCircle(circleRect);
    //3:
    circleRect = Rect.fromCircle(
      center: childRect.center - Offset(screenWidth / 2, -450),
      radius: radius,
    );
    drawCircle(circleRect);
    //4:
    circleRect = Rect.fromCircle(
      center: childRect.center + offset + Offset(screenWidth / 9, 360),
      radius: radius,
    );
    drawCircle(circleRect);
  }

  Widget _homeAppBar(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    double avatarSize = 32;
    return [
      lpSvgWidget(
        Assets.svg.defaultDeviceAvatar,
      )
          .circleShadow(
            clipContent: false,
            padding: EdgeInsets.all(globalTheme.m),
            width: avatarSize,
            height: avatarSize,
          )
          .paddingSymmetric(horizontal: globalTheme.xh),
      Text(LPS.of(context).clickConnectDeviceLabel)
          .paddingSymmetric(horizontal: globalTheme.h)
          .inkWell(onTap: () {})
          .wrapContent(AlignmentDirectional.centerStart)
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
              .ratio(358 / 150)
              .clipRadius()
              .paddingSymmetric(horizontal: kXh),
          SliverPaintWidget(painter: _drawCircleGradient),
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
              "$defaultTargetPlatform\n$screenWidthPixel:$deviceWidthPixel $screenHeightPixel:$deviceHeightPixel"
                  .text(
                    textAlign: TextAlign.center,
                  )
                  .ink(onTap: () {
                    defHiveBoxFilePath
                        .shareFile(
                          subject: "subject",
                          text: "text",
                        )
                        .get();
                  })
                  .container(alignment: Alignment.bottomCenter)
                  .expanded(),
            Empty.height(kBottomNavigationBarCoverHeight)
          ].column().rFill(
                fillOverscroll: true,
              ),
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
          decoration: fillDecoration(context: context),
        )
        .columnOf(Text(label).paddingAll(globalTheme.h))
        .ink(
          onTap: onTap,
          radius: kDefaultBorderRadiusXXX,
          backgroundColor: "#F6F6F6".toColor(),
        );
  }
}
