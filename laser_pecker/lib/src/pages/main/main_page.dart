part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

const double kBottomNavigationBarCoverHeight = 16.0;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BottomNavigationMixin {
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
        const HomePage().keepAlive(),
        const CommunityPage().keepAlive(),
        const MinePage().keepAlive(),
      ],
    );
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
        currentNavigateIndex = index;
        pageController.jumpToPage(index);
        context.tryUpdateState();
      },
    );
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
                height: kBottomNavigationBarHeight +
                    kBottomNavigationBarCoverHeight,
                alignment: null,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              )),
        ),
      ],
    );
  }
}
