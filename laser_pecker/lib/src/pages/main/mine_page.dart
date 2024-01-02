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

class _MinePageState extends State<MinePage>
    with LifecycleAware, LifecycleMixin {
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
    var nickname = userBean?.nickname ?? "--";
    if (isDebug) {
      nickname += "(${userBean?.id.toString()})";
    }
    return [
      //row1
      [
        (avatar == null
                ? lpSvgWidget(
                    Assets.svg.defaultDeviceAvatar,
                    fit: BoxFit.cover,
                  )
                : avatar
                    .toImageWidget(
                      memCacheHeight: avatarSize.toInt(),
                      memCacheWidth: avatarSize.toInt(),
                    )
                    .hero(avatar)
                    .click(() {
                    context.showPhotoPage(
                      imageProvider: avatar.toImageProvider(),
                    );
                  }))
            .circleShadow(
              padding: EdgeInsets.all(globalTheme.s),
              width: avatarSize,
              height: avatarSize,
            )
            .padding(globalTheme.xh, 0, globalTheme.h, 0),
        nickname.text().paddingAll(globalTheme.l).ink(
          onTap: () {
            context.pushWidget(const UserInfoPage());
          },
        ).material(),
      ].row()!.paddingSymmetric(vertical: globalTheme.x).safeArea(),
      //row2
      if (kShowCommunityControl)
        [
          [
            (userBean?.attention ?? 0).text(
              style: globalTheme.textLabelStyle,
            ),
            LPS.of(context).attention.text()
          ].column()!.click(() {
            context.pushWidget(const AttentionFansPage(
              tabIndex: 0,
            ));
          }).expanded(),
          [
            (userBean?.follow ?? 0).text(
              style: globalTheme.textLabelStyle,
            ),
            LPS.of(context).fans.text()
          ].column()!.click(() {
            context.pushWidget(const AttentionFansPage(
              tabIndex: 1,
            ));
          }).expanded(),
          [
            (userBean?.like ?? 0).text(
              style: globalTheme.textLabelStyle,
            ),
            LPS.of(context).like.text()
          ].column()!.click(() {
            //showGeneralDialog(context: context, pageBuilder: pageBuilder)
            showDialog(
                context: context,
                builder: (context) {
                  return const LikeTipDialog();
                });
          }).expanded(),
        ].row()!.paddingOnly(
              left: barPadding,
              top: barPadding,
              right: barPadding,
              bottom: barPadding + coverHeight,
            ),
    ].column()!;
  }

  /// 设备第一个信息
  Widget _buildDeviceItem(
    BuildContext context,
    List<ConnectDeviceBean>? deviceBeanList,
    Object? error,
  ) {
    if (error != null) {
      var globalTheme = GlobalTheme.of(context);
      return "获取失败, 点击重试".text(style: globalTheme.textDesStyle).ink(onTap: () {
        userModel.fetchDeviceList();
      }).wrapContent();
    }
    var deviceBean = deviceBeanList?.firstOrNull;
    return DeviceInfoTile(deviceInfoBean: deviceBean);
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      userModel.fetchUserInfo();
      userModel.fetchDeviceList();
    }
  }

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return Scaffold(
      body: [
        userModel.userBeanData
            .listener((context, userBean, error) => _mineAppBar(context)),
        SliverPaintWidget(
          painter: _drawMineBackground,
        ),
        //功能区↓
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineArticle),
          label: LPS.of(context).article,
          onTap: () {},
        ).rGridTile(3, childAspectRatio: 1 / 0.65),
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineFiles),
          label: LPS.of(context).files,
          onTap: () {},
        ).rGridTile(3),
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineHistory),
          label: LPS.of(context).history,
          onTap: () {},
        ).rGridTile(3),
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineHelp),
          label: LPS.of(context).help,
          onTap: () {},
        ).rGridTile(3),
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineSetting),
          label: LPS.of(context).setting,
          onTap: () {
            context.pushWidget(const UserSettingPage());
          },
        ).rGridTile(3),
        SingleGridTile(
          iconWidget: lpSvgWidget(Assets.svg.mineFaq),
          label: LPS.of(context).faq,
          onTap: () {},
        ).rGridTile(3),
        //最近连接的设备↓
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
              .row()!
              .inkWell(onTap: () {
            context.pushWidget(const DeviceHistoryPage());
          }),
        ].row()!.paddingAll(globalTheme.xh),
        //设备↓
        userModel.connectDeviceListData.listener(_buildDeviceItem),
        //last↓
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
              padding: EdgeInsets.all(bottomNavigationBarCoverHeight),
              alignment: Alignment.bottomCenter,
            )
            .rFill(),
      ].rScroll(),
    );
  }
}
