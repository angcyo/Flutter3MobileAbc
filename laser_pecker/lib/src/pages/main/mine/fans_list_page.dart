part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/12
///

/// 粉丝列表界面
class FansListPage extends StatefulWidget {
  const FansListPage({super.key});

  @override
  State<FansListPage> createState() => _FansListPageState();
}

class _FansListPageState extends State<FansListPage> with RScrollPage {
  @override
  void onLoadData() {
    var globalTheme = GlobalTheme.of(context);
    "/square/follow/getByUserId".post(data: {
      "type": 0,
      ...pageRequestData(),
    }).http((value, error) {
      final list = value["records"]
          ?.map<Widget>((element) => ListUserInfoTile(
                listUserBean: ListUserBean.fromJson(element),
                isFans: true,
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
