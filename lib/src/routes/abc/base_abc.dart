part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

/// 有状态的Abc混入
mixin BaseAbcStateMixin<T extends StatefulWidget> on State<T> {
  /// 构建标题栏
  String? title;

  /// 是否使用滚动小部件[RScrollView]
  bool useScroll = true;

  /// [RScrollView.enableFrameLoad]
  bool enableFrameLoad = false;

  /// [RScrollView.frameSplitDuration]
  Duration frameSplitDuration = const Duration(milliseconds: 16);

  //---

  int currentIndex = 1;

  onPressed() {
    toastInfo("onPressed:${nowTimeString()}");
  }

  onClosing([T? result]) {
    context.maybePop(result);
  }

  onSelectedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  dynamic currentValue;

  onValueChanged(dynamic value) {
    setState(() {
      currentValue = value;
    });
  }

  //---

  /// 构建标题栏
  @protected
  PreferredSizeWidget buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text(title ?? '${widget.runtimeType}'),
      flexibleSpace: linearGradientWidget(
          listOf(themeData.primaryColor, themeData.primaryColorDark)),
    );
  }

  /// 构建内容
  /// ```
  /// return const Placeholder();
  /// ```
  @protected
  Widget buildBody(BuildContext context) {
    return const Placeholder();
  }

  /// 构建一个列表内容
  @protected
  List<Widget> buildBodyList(BuildContext context) {
    return [];
  }

  /// 构建abc入口
  @protected
  Widget buildAbc(BuildContext context) {
    List<Widget> bodyList = buildBodyList(context);
    Widget body = buildBody(context);

    if (useScroll) {
      //使用滚动小部件
      if (bodyList.isEmpty) {
        body = RScrollView(
          enableFrameLoad: enableFrameLoad,
          frameSplitDuration: frameSplitDuration,
          children: [body],
        );
      } else {
        body = RScrollView(
          enableFrameLoad: enableFrameLoad,
          frameSplitDuration: frameSplitDuration,
          children: bodyList,
        );
      }
    } else {
      if (bodyList.isNotEmpty) {
        //有多个child, 则使用Column包裹起来
        body = Column(
          children: bodyList,
        );
      }
    }
    return body;
  }

  /// override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Builder(builder: (context) => buildAbc(context)),
    );
  }
}
