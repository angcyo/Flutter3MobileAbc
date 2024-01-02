import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';

import 'add_device_bean.dart';
import 'add_device_tile.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/30
///
/// 添加设备界面
class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage>
    with RScrollPage, AbsScrollPage, LpScrollPageMixin {
  @override
  String? getTitle(BuildContext context) => "添加设备";

  @override
  Color? getBackgroundColor(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return globalTheme.themeWhiteColor;
  }

  @override
  bool get enableRefresh => false;

  List<AddDeviceBean>? deviceList;
  AddDeviceBean? _selectedDeviceBean;

  @override
  void onLoadData() {
    loadAssetString(
      'assets/json/add_device_list.json',
      package: "laser_pecker",
    ).get((value, error) {
      deviceList = (value as String?)
              ?.fromJsonIterable()
              ?.mapToList<AddDeviceBean>(
                  (element) => AddDeviceBean.fromJson(element))
              .whereToList(
                  (element) => element?.debug == true ? isDebug : true) ??
          deviceList;
      updateDeviceList(error);
    });
  }

  @override
  Widget buildBody(BuildContext context, WidgetList? children) {
    final globalTheme = GlobalTheme.of(context);
    return [
      super.buildBody(context, children).expanded(),
      GradientButton(
              enable: _selectedDeviceBean != null,
              minWidth: double.infinity,
              radius: kDefaultBorderRadiusX,
              textStyle: globalTheme.textBodyStyle
                  .copyWith(fontWeight: FontWeight.bold),
              onTap: () {
                toastBlur(text: "添加设备:${_selectedDeviceBean?.name}");
              },
              child: "下一步".text())
          .paddingCss(kX, kH),
    ].column(mainAxisSize: MainAxisSize.max)!;
  }

  /// 更新设备列表
  void updateDeviceList([error]) {
    final list = deviceList
        ?.map<Widget>((element) => AddDeviceTile(
              bean: element,
              isSelected: _selectedDeviceBean == element,
            ).click(() {
              _selectedDeviceBean = element;
              updateDeviceList();
            }).rGridTile(2, mainAxisSpacing: kX))
        .toList();
    loadDataEnd(list, error);
  }
}
