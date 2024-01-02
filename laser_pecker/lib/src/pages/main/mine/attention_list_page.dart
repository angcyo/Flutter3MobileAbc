part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/12
///

/// 关注列表界面
class AttentionListPage extends StatefulWidget {
  const AttentionListPage({super.key});

  @override
  State<AttentionListPage> createState() => _AttentionListPageState();
}

class _AttentionListPageState extends State<AttentionListPage>
    with RScrollPage {
  @override
  void onLoadData() {
    var globalTheme = GlobalTheme.of(context);
    "/square/follow/getByUserId".post(data: {
      "type": 1,
      ...pageRequestData(),
    }).http((value, error) {
      final list = value?["records"]
          ?.map<Widget>((element) => ListUserInfoTile(
                listUserBean: ListUserBean.fromJson(element),
                isFans: false,
              ).rItemTile(
                firstPaddingTop: globalTheme.x,
              ))
          .toList();
      loadDataEnd(list, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return pageRScrollView();
  }
}
