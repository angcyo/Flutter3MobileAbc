part of laser_pecker;

///
/// 社区界面
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/20
///

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin, TabBarMixin {
  final ValueNotifier<int?> softTypeValue = ValueNotifier(null);

  @override
  void initState() {
    tabItemList = [
      "动态".text().align(
            alignment: Alignment.bottomCenter,
            minHeight: kTabItemHeight,
          ),
      "教程".text().align(
            alignment: Alignment.bottomCenter,
            minHeight: kTabItemHeight,
          ),
      "精选".text().align(
            alignment: Alignment.bottomCenter,
            minHeight: kTabItemHeight,
          ),
    ];
    tabPageList = [
      DynamicPage(softTypeValue: softTypeValue)
          .widgetState(loading: 0 == tabInitialIndex)
          .pageChildLifecycle(index: 0),
      const TutorialPage()
          .widgetState(loading: 1 == tabInitialIndex)
          .pageChildLifecycle(index: 1),
      const ChoicesPage()
          .widgetState(loading: 2 == tabInitialIndex)
          .pageChildLifecycle(index: 2),
    ];
    super.initState();
  }

  Widget _buildAppBar(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return [
      [
        const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        "受欢迎的材料".text().expanded(),
      ]
          .row()!
          .container(
            color: globalTheme.itemWhiteBgColor,
            margin: const EdgeInsets.only(left: kX),
            padding: const EdgeInsets.all(kH),
            radius: kH,
          )
          .expanded(),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        visualDensity: VisualDensity.compact,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_none).badge(),
        visualDensity: VisualDensity.compact,
      ),
    ].row()!.safeArea();
  }

  @override
  Widget build(BuildContext context) {
    var globalTheme = GlobalTheme.of(context);
    return Scaffold(
      body: [
        _buildAppBar(context),
        [
          buildTabBar(
            context,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            labelStyle: globalTheme.textTitleStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ).expanded(),
          "筛选".text().paddingAll(kH).ink(onTap: () {})
        ].row(),
        buildTabBarView(context).pageLifecycle().expanded(),
      ].column(mainAxisSize: MainAxisSize.max),
    );
  }
}
