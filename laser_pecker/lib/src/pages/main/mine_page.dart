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
    var globalTheme = GlobalTheme.of(context);
    if (deviceBean == null) {
      return GlobalConfig.of(context).loadingIndicatorBuilder(context);
    }
    var devicePngKey = Assets.png.deviceL1.keyName;
    var deviceModel = deviceBean.deviceModel ?? "";
    if (deviceModel.startsWith('$kProductPrefix-CI') ||
        deviceModel.startsWith('LX1')) {
      devicePngKey = Assets.png.deviceC1.keyName;
    } else if (deviceModel.startsWith('$kProductPrefix-V') ||
        deviceModel.startsWith('LP5')) {
      devicePngKey = Assets.png.deviceL5.keyName;
    } else if (deviceModel.startsWith('$kProductPrefix-L4') ||
        deviceModel.startsWith('LP4')) {
      devicePngKey = Assets.png.deviceL4.keyName;
    } else if (deviceModel.startsWith('$kProductPrefix-L3') ||
        deviceModel.startsWith('LP3')) {
      devicePngKey = Assets.png.deviceL3.keyName;
    } else if (deviceModel.startsWith('$kProductPrefix-L2') ||
        deviceModel.startsWith('LP2')) {
      devicePngKey = Assets.png.deviceL2.keyName;
    }
    return (deviceBean.blueName ?? "--")
        .text()
        .paddingOnly(
          left: globalTheme.xh,
          top: globalTheme.x,
          bottom: globalTheme.x,
        )
        .rowOf(
          lpSvgWidget(Assets.svg.copy).paddingAll(globalTheme.xh).ink(
                radius: 999,
                onTap: () {
                  deviceBean.toJsonString().copy().ignore();
                  toast("已复制到剪切板".text());
                },
              ),
          mainAxisAlignment: MainAxisAlignment.start,
        )
        .columnOf(
          lpImageWidget(
            devicePngKey,
            width: 76,
            height: 76,
          )
              .container(
                  decoration: fillDecoration(
                fillColor: globalTheme.themeWhiteColor,
              ))
              .rowOf(
                stringBuilder((builder) {
                  builder.appendLine(
                      '${LPS.of(context).machineType}: ${deviceBean.deviceModel}');
                  builder.appendLine(
                      '${LPS.of(context).registerTime}: ${deviceBean.createTime}');
                  builder.appendLine(
                      '${LPS.of(context).firmwareVersion}: V${deviceBean.firmwareVersion?.toVersionString()}');
                  builder.append(
                      '${LPS.of(context).softwareVersion}: V${deviceBean.appVersion}');
                })
                    .text(
                      style: globalTheme.textSubStyle,
                    )
                    .paddingOnly(
                      left: globalTheme.x,
                    )
                    .expanded(),
              )
              .paddingOnly(
                left: globalTheme.xh,
                right: globalTheme.xh,
                bottom: globalTheme.xh,
              ),
        )
        .container(
          decoration: fillDecoration(fillColor: "#F9F9F59".toColor()),
        )
        .paddingOnly(
          left: globalTheme.xh,
          right: globalTheme.xh,
          bottom: globalTheme.x,
        );
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
              .inkWell(onTap: () {}),
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
