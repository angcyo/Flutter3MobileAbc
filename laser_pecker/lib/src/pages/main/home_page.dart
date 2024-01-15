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

class _HomePageState extends State<HomePage>
    with LifecycleAware, LifecycleMixin {
  late UserModel userModel = vm();

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

    var userBean = userModel.userBeanData.value;
    var nickname = userBean?.nickname;

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
          .paddingOnly(left: globalTheme.xh, right: globalTheme.l),
      [
        Text(LPS.of(context).clickConnectDeviceLabel),
        if (nickname != null) nickname.text()
      ]
          .column(crossAxisAlignment: CrossAxisAlignment.start)!
          .paddingSymmetric(horizontal: globalTheme.h)
          .inkWell(onTap: () {
            toastBlur(
              text: "连接设备",
            );
          })
          .wrapContent(alignment: AlignmentDirectional.centerStart)
          .expanded(),
      lpSvgWidget(
        Assets.svg.addDevice,
      ).paddingAll(globalTheme.xh).inkWellCircle(onTap: () {
        //toastMessage("添加设备".text());
        context.pushWidget(const AddDevicePage());
      }),
    ].row()!.paddingSymmetric(vertical: globalTheme.x).safeArea();
  }

  Widget _buildBanner(
    BuildContext context,
    List<BannerBean>? bannerList,
    Object? error,
  ) {
    var defWidget =
        lpImageWidget(Assets.png.defaultBanner.keyName, fit: BoxFit.cover)!;
    Widget result;
    if (bannerList == null || bannerList.isEmpty) {
      result = defWidget;
    } else {
      result = bannerList.toSwiper(builder: (bean, index) {
        return bean.sourcePath?.toNetworkImageWidget().click(() {
              var jumpPath = bean.jumpPath;
              if (jumpPath?.isNotEmpty == true) {
                if (jumpPath!.isExternalUrl) {
                  //外部链接, 使用外部浏览器打开网页
                  jumpPath.launch();
                } else {
                  //使用内部浏览器打开网页
                  jumpPath.openUrl(context);
                }
              }
            }) ??
            defWidget;
      });
    }
    return result
        .ratio(358 / 150)
        .clipRadius()
        .paddingSymmetric(horizontal: kXh);
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        LiveDataBuilder(
          liveData: userModel.userBeanData,
          builder: (context, userBean) {
            return _homeAppBar(context);
          },
        ),
        [
          userModel.bannerListData.listener(
            (context, liveData, error) =>
                _buildBanner(context, liveData, error),
          ),
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
              onTap: () {
                context.pushWidget(const MaterialsPage());
              }).rGridTile(2),
          [
            if (isDebug)
              "$currentPlatform $devicePixelRatio\n${screenWidthPixel.toDigits()}/${deviceWidthPixel.toDigits()} ${screenHeightPixel.toDigits()}/${deviceHeightPixel.toDigits()}"
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
            Empty.height(bottomNavigationBarCoverHeight)
          ].column()!.rFill(
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
        .columnOf(Text(label).paddingAll(globalTheme.h))!
        .ink(
          onTap: onTap,
          radius: kDefaultBorderRadiusXXX,
          backgroundColor: "#F6F6F6".toColor(),
        );
  }
}
