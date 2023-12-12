part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/12
///

/// 关注/粉丝界面
class AttentionFansPage extends StatefulWidget {
  /// [0] 关注
  /// [1] 粉丝
  final int tabIndex;

  const AttentionFansPage({
    super.key,
    required this.tabIndex,
  });

  @override
  State<AttentionFansPage> createState() => _AttentionFansPageState();
}

class _AttentionFansPageState extends State<AttentionFansPage>
    with SingleTickerProviderStateMixin {
  late UserModel userModel;
  late TabController tabController =
      TabController(initialIndex: widget.tabIndex, length: 2, vsync: this)
        ..addListener(() {
          //pageController.jumpToPage(tabController.index);
        });

/*  late PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  )..addListener(() {
      tabController.animateTo(pageController.page?.round() ?? 0);
    });*/

  @override
  void initState() {
    userModel = context.getViewModel();
    super.initState();
  }

  /// [TabBarTheme]
  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    return Scaffold(
      appBar: globalConfig.appBarBuilder(
        context,
        this,
        title: (userModel.userBeanData.value?.nickname ?? "").text(),
        flexibleSpace: linearGradientWidget(
            listOf(globalConfig.globalTheme.themeWhiteColor)),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: globalConfig.globalTheme.primaryColor,
          tabs: [
            Tab(
              text: LPS.of(context).attention,
            ),
            Tab(
              text: LPS.of(context).fans,
            ),
          ],
          unselectedLabelStyle: globalConfig.globalTheme.textBodyStyle,
          labelStyle: globalConfig.globalTheme.textBodyStyle
              .copyWith(fontWeight: FontWeight.bold),
        ).size(width: 240).sizePreferred(width: 40),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          AttentionListPage(),
          FansListPage(),
        ],
      ),
    );
  }
}
