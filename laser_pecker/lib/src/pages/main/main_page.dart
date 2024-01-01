part of laser_pecker;

///
/// 主界面, 包含底部TabItem
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

double get bottomNavigationBarCoverHeight => isIos ? 32.0 : 16.0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BottomNavigationMixin {
  late UserModel userModel;
  int currentNavigateIndex = 0;

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  Widget buildPages(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const HomePage().pageChildLifecycle(index: 0),
        const CommunityPage().pageChildLifecycle(index: 1),
        const MinePage().pageChildLifecycle(index: 2),
      ],
    ).pageLifecycle();
  }

  Widget buildNavigationBar(BuildContext context) {
    final appTheme = GlobalTheme.of(context);
    final navItems = [
      BottomNavigationBarItem(
        icon: loadAssetSvgWidget(Assets.svg.homeNormal,
            package: "laser_pecker",
            colorFilter: appTheme.icoNormalColor.toColorFilter()),
        activeIcon: loadAssetSvgWidget(Assets.svg.homeSelected,
            package: "laser_pecker",
            colorFilter: appTheme.icoSelectedColor.toColorFilter()),
        label: LPS.of(context).home,
      ),
      if (kShowCommunityControl)
        BottomNavigationBarItem(
          icon: loadAssetSvgWidget(Assets.svg.communityNormal,
              package: "laser_pecker",
              colorFilter: appTheme.icoNormalColor.toColorFilter()),
          activeIcon: loadAssetSvgWidget(Assets.svg.communitySelected,
              package: "laser_pecker",
              colorFilter: appTheme.icoSelectedColor.toColorFilter()),
          label: LPS.of(context).community,
        ),
      BottomNavigationBarItem(
        icon: loadAssetSvgWidget(Assets.svg.mineNormal,
            package: "laser_pecker",
            colorFilter: appTheme.icoNormalColor.toColorFilter()),
        activeIcon: loadAssetSvgWidget(Assets.svg.mineSelected,
            package: "laser_pecker",
            colorFilter: appTheme.icoSelectedColor.toColorFilter()),
        label: LPS.of(context).mine,
      ),
    ];
    TextStyle selectedLabelStyle = TextStyle(
      fontSize: 12,
      color: appTheme.icoSelectedColor,
    );
    TextStyle unselectedLabelStyle = selectedLabelStyle.copyWith(
      color: appTheme.icoNormalColor,
    );
    return BottomNavigationBar(
      items: navItems,
      elevation: 0,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: appTheme.icoSelectedColor,
      unselectedItemColor: appTheme.icoNormalColor,
      currentIndex: currentNavigateIndex,
      selectedLabelStyle: selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      onTap: (index) {
        _switchPage(context, index);
      },
    );
  }

  _switchPage(BuildContext context, int index) {
    if (index <= 0) {
      _switchPageTo(index);
    } else {
      userModel.wrapLogin(context, () {
        _switchPageTo(index);
      });
    }
  }

  _switchPageTo(int index) {
    currentNavigateIndex = index;
    pageController.jumpToPage(index);
    context.tryUpdateState();
  }

  void _onLogout(bool? liveData) {
    if (liveData == true) {
      //退出登录后, 自动切换到首页
      l.i('切换到首页');
      _switchPage(context, 0);
    }
  }

  @override
  void initState() {
    super.initState();
    userModel = context.getViewModel();
    userModel.logoutOnceData.observe(_onLogout, emitCurrentValue: false);
  }

  @override
  void dispose() {
    //userModel.onDispose();
    userModel.logoutOnceData.removeObserver(_onLogout);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: buildPages(context),
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: buildNavigationBar(context).radiusShadow(
                height:
                    kBottomNavigationBarHeight + bottomNavigationBarCoverHeight,
                alignment: null,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              )),
        ),
      ],
    ).wrapViewModelListProvider([userModel]);
  }
}
