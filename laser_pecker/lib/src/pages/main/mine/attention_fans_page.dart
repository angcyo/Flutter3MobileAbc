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
    var globalTheme = GlobalTheme.of(context);
    return Scaffold(
      appBar: globalConfig.appBarBuilder(
        context,
        this,
        elevation: 1,
        title: (userModel.userBeanData.value?.nickname ?? "").text(),
        flexibleSpace:
            linearGradientWidget(listOf(globalTheme.themeWhiteColor)),
        bottom: userModel.userBeanData
            .listener((context, liveData, error) {
              var attentionCount = liveData?.attention ?? 0;
              var fansCount = liveData?.follow ?? 0;

              var attention = LPS.of(context).attention;
              if (attentionCount > 0) {
                attention += "($attentionCount)";
              }

              var fans = LPS.of(context).fans;
              if (fansCount > 0) {
                fans += "($fansCount)";
              }

              return TabBar(
                controller: tabController,
                indicatorColor: globalTheme.primaryColor,
                tabs: [
                  Tab(text: attention),
                  Tab(text: fans),
                ],
                //indicatorPadding: EdgeInsets.only(bottom: 10),
                //indicatorPadding: EdgeInsets.all(10),
                //indicator: strokeDecoration(),
                dividerHeight: 0,
                unselectedLabelStyle: globalTheme.textBodyStyle,
                labelStyle: globalTheme.textBodyStyle
                    .copyWith(fontWeight: FontWeight.bold),
              );
            })
            .size(width: 240)
            .sizePreferred(),
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
