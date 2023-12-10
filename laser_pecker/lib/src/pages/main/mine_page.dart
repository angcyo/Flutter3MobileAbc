part of laser_pecker;

/// 我的
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  late UserModel userModel = vm();

  /// 白色半圆覆盖的高度
  double coverHeight = kX * 2;
  double barPadding = kX;

  @override
  void initState() {
    super.initState();
  }

  void _drawMineBackground(Canvas canvas, Rect childRect, Rect parentRect) {
    var globalTheme = GlobalTheme.of(context);
    var colors = [globalTheme.primaryColor, globalTheme.primaryColorDark];
    Rect backgroundRect = Rect.fromLTRB(
      parentRect.left,
      parentRect.top,
      parentRect.right,
      childRect.top,
    );
    canvas.drawRect(
      backgroundRect,
      Paint()
        ..shader = linearGradientShader(
          colors,
          rect: parentRect,
        ),
    );
    Rect bottomRect = Rect.fromLTRB(
      parentRect.left,
      childRect.top - coverHeight,
      parentRect.right,
      childRect.top,
    );
    canvas.drawRRect(
      bottomRect.toRRectTB(topRadius: kDefaultBorderRadiusXXX),
      Paint()..color = Colors.white,
    );
  }

  Widget _mineAppBar(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    double avatarSize = 48;
    var userBean = userModel.userBeanData.value;
    var avatar = userBean?.avatar;
    return [
      //row1
      [
        (avatar == null
                ? lpSvgWidget(
                    Assets.svg.defaultDeviceAvatar,
                    fit: BoxFit.cover,
                  )
                : avatar.toNetworkImageWidget(
                    memCacheHeight: avatarSize.toInt(),
                    memCacheWidth: avatarSize.toInt(),
                  ))
            .circleShadow(
              padding: EdgeInsets.all(globalTheme.s),
              width: avatarSize,
              height: avatarSize,
            )
            .paddingSymmetric(horizontal: globalTheme.xh),
        (userBean?.nickname ?? "--").text(),
      ].row().paddingSymmetric(vertical: globalTheme.x).safeArea(),
      //row2
      if (kShowCommunityControl)
        [
          [(userBean?.attention ?? 0).text(), LPS.of(context).attention.text()]
              .column()
              .expanded(),
          [(userBean?.follow ?? 0).text(), LPS.of(context).fans.text()]
              .column()
              .expanded(),
          [(userBean?.like ?? 0).text(), LPS.of(context).like.text()]
              .column()
              .expanded(),
        ].row().paddingOnly(
              left: barPadding,
              top: barPadding,
              right: barPadding,
              bottom: barPadding + coverHeight,
            ),
    ].column();
  }

  /// 设备第一个信息
  Widget _buildDeviceItem(
    BuildContext context,
    List<ConnectDeviceBean>? deviceBeanList,
  ) {
    var deviceBean = deviceBeanList?.firstOrNull;
    return DeviceInfoTile(deviceBean: deviceBean);
  }

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return Scaffold(
      body: [
        userModel.userBeanData
            .listener((context, userBean) => _mineAppBar(context)),
        SliverPaintWidget(
          painter: _drawMineBackground,
        ),
        lpSvgWidget(Assets.svg.mineArticle)
            .columnOf(LPS.of(context).article.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3, childAspectRatio: 1 / 0.6),
        lpSvgWidget(Assets.svg.mineFiles)
            .columnOf(LPS.of(context).files.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineHistory)
            .columnOf(LPS.of(context).history.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineHelp)
            .columnOf(LPS.of(context).help.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineSetting)
            .columnOf(LPS.of(context).setting.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3),
        lpSvgWidget(Assets.svg.mineFaq)
            .columnOf(LPS.of(context).faq.text())
            .ink(
              onTap: () {},
            )
            .rGridTile(3),
        [
          LPS
              .of(context)
              .nearConnectedDeviceLabel
              .text(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
              .expanded(),
          [LPS.of(context).more.text(), lpSvgWidget(Assets.svg.next)]
              .row()
              .inkWell(onTap: () {
            context.pushWidget(const DeviceHistoryPage());
          }),
        ].row().paddingAll(globalTheme.xh),
        userModel.connectDeviceListData.listener(_buildDeviceItem),
        packageInfo
            .toWidget((info) =>
                "${LPS.of(context).appVersionTip(info!.version)}\n$info"
                    .text(
                  textAlign: TextAlign.center,
                )
                    .ink(onTap: () {
                  shareAppLog();
                  /*"${LPS.of(context).appVersionTip(info!.version)}\n$info"
                      .share()
                      .get();*/
                }))
            .container(
              padding: const EdgeInsets.all(kBottomNavigationBarCoverHeight),
              alignment: Alignment.bottomCenter,
            )
            .rFill(),
      ].rScroll(),
    );
  }
}
