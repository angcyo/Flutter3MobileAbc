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

class _CommunityPageState extends State<CommunityPage> with StateLogMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return randomTextWidget();
  }
}
