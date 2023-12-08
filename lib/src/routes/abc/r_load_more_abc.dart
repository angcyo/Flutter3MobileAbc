part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/08
///

class RLoadMoreAbc extends StatefulWidget {
  const RLoadMoreAbc({super.key});

  @override
  State<RLoadMoreAbc> createState() => _RLoadMoreAbcState();
}

class _RLoadMoreAbcState extends State<RLoadMoreAbc> {
  final RScrollController scrollController = RScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.updateWidgetState(WidgetState.loading);
  }

  @override
  Widget build(BuildContext context) {
    var globalConfig = GlobalConfig.of(context);
    return Scaffold(
      appBar: globalConfig.appBarBuilder(context, this),
      body: RScrollView(
        controller: scrollController,
        children: [
          for (var i = 0; i < 100; i++)
            RItemTile(
              child: randomLogWidget("item $i"),
            ),
        ],
      ),
    );
  }
}
