part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/21
///

mixin LpScrollPageMixin on AbsScrollMixin {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    final globalConfig = GlobalConfig.of(context);
    return globalConfig.appBarBuilder(
      context,
      this,
      elevation: 0,
      title: buildTitle(context),
      flexibleSpace: linearGradientWidget(
          listOf(globalConfig.globalTheme.themeWhiteColor)),
    );
  }
}
