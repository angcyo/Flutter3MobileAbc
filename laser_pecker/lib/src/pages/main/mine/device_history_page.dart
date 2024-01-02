part of laser_pecker;

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/12/10
///

/// 历史连接设备界面
class DeviceHistoryPage extends StatefulWidget {
  const DeviceHistoryPage({super.key});

  @override
  State<DeviceHistoryPage> createState() => _DeviceHistoryPageState();
}

class _DeviceHistoryPageState extends State<DeviceHistoryPage>
    with RScrollPage {
  @override
  void onLoadData() {
    var globalTheme = GlobalTheme.of(context);
    "/device/getPageInfo".post(data: pageRequestData()).http((value, error) {
      final list = value?["records"]
          ?.map<Widget>((element) => DeviceInfoTile(
                      deviceInfoBean: ConnectDeviceBean.fromJson(element))
                  .rItemTile(
                firstPaddingTop: globalTheme.x,
              ))
          .toList();
      loadDataEnd(list, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    //debugger();
    var globalConfig = GlobalConfig.of(context);
    return Scaffold(
      appBar: globalConfig.appBarBuilder(
        context,
        this,
        title: LPS.of(context).deviceHistory.text(),
        flexibleSpace: linearGradientWidget(
            listOf(globalConfig.globalTheme.themeWhiteColor)),
      ),
      body: pageRScrollView(),
    );
  }
}
