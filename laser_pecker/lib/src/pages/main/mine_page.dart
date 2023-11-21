part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  Widget _mineAppBar(BuildContext context) {
    var showCommunityControl = true;
    var globalTheme = GlobalTheme.of(context);
    var colors = [globalTheme.primaryColor, globalTheme.primaryColorDark];
    //var colors = [Colors.redAccent, Colors.blue];
    double avatarSize = 48;
    return [
      //row1
      [
        lpSvgWidget(
          Assets.svg.defaultDeviceAvatar,
          fit: BoxFit.cover,
        )
            .circleShadow(
              clipContent: false,
              padding: EdgeInsets.all(globalTheme.m),
              width: avatarSize,
              height: avatarSize,
            )
            .paddingSymmetric(horizontal: globalTheme.xh),
        "LP-001".text(),
      ].row().paddingSymmetric(vertical: globalTheme.x).safeArea(),
      //row2
      if (showCommunityControl)
        [
          ["32".text(), LPS.of(context).attention.text()].column().expanded(),
          ["102".text(), LPS.of(context).fans.text()].column().expanded(),
          ["9".text(), LPS.of(context).like.text()].column().expanded(),
        ].row().paddingAll(kX),
    ].column().container(decoration: lineaGradientDecoration(colors));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mineAppBar(context),
    );
  }
}
