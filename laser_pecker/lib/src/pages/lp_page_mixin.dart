part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/21
///

mixin LpScrollPageMixin on AbsScrollPage {
  @override
  double? getAppBarElevation(BuildContext context) {
    return 0;
  }

  @override
  Widget? buildAppBarFlexibleSpace(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return linearGradientWidget(listOf(globalTheme.themeWhiteColor));
  }
}
