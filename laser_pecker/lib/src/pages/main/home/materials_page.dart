import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';

import '../../../models/bean/materials_bean.dart';
import '../../../models/bean/materials_type_bean.dart';
import 'materials_tile.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/12/29
///
/// 素材页面
class MaterialsPage extends StatefulWidget {
  const MaterialsPage({super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage>
    with RScrollPage, RStatusScrollPage, AbsScrollPage, LpScrollPageMixin {
  TextFieldConfig searchFieldConfig = TextFieldConfig(
    hintText: "请输入关键字",
    onSubmitted: (text) {
      toastBlur(text: "搜索:$text");
    },
    /*hintText: "搜索素材",
    prefixIcon: Icons.search,
    suffixIcon: Icons.close,
    onSuffixTap: () {},*/
  );

  @override
  String? getTitle(BuildContext context) => "素材";

  @override
  double? getAppBarElevation(BuildContext context) => 2;

  @override
  Color? getAppBarShadowColor(BuildContext context) => Colors.black12;

  @override
  PreferredSizeWidget? buildAppBarBottom(BuildContext context) {
    return SearchWidget(searchFieldConfig: searchFieldConfig);
  }

  @override
  Widget buildBody(BuildContext context, WidgetList? children) {
    final globalTheme = GlobalTheme.of(context);
    return [
      [
        for (var type in getStatusDataList<MaterialsTypeBean>())
          [
            /*if (!isNullOrEmpty(type.background))
              type.background?.toImageWidget(
                fit: BoxFit.fill,
                height: 25,
              ),*/
            type.name
                ?.text(
                    fontWeight: isCurrentStatus(type) ? FontWeight.bold : null)
                .padding(kH, kM),
          ]
              .stack(alignment: Alignment.center)
              .container(
                radius: kMaxBorderRadius,
                borderColor: isCurrentStatus(type)
                    ? globalTheme.accentColor
                    : globalTheme.lineColor,
                constraints: isNullOrEmpty(type.background)
                    ? null
                    : const BoxConstraints(minWidth: 100) /*有背景的情况下, 拉大宽度*/,
                decorationImage: isNullOrEmpty(type.background)
                    ? null
                    : DecorationImage(
                        image: type.background!.toImageProvider(),
                        fit: BoxFit.fill,
                      ),
              )
              .click(() {
            switchStatus(type);
          }),
      ].wrap().matchParent(matchHeight: false).container(
            padding: edgeInsets(kX),
            color: globalTheme.themeWhiteColor,
          ),
      super.buildBody(context, children).expanded(),
    ].column(mainAxisSize: MainAxisSize.max);
  }

  @override
  void onLoadData() {
    //debugger();
    super.onLoadData();
  }

  @override
  void onLoadStatusList() {
//    debugger();
    "/images/getListBySort".post().http((value, error) {
      var list = (value as Iterable?)?.mapToList<MaterialsTypeBean>(
          (element) => MaterialsTypeBean.fromJson(element));
      loadStatusEnd(list, error);
    });
  }

  /// 选中的素材
  MaterialsBean? _materialsBean;

  @override
  void onLoadStatusData(status) {
    //debugger();
    final bean = status as MaterialsTypeBean;
    "/images/getPageInfoByType".post(data: {
      "type": bean.value,
      ...pageRequestData(),
    }).http((value, error) {
      var list = (value?["records"] as Iterable?)?.mapToList<Widget>((element) {
        final materialsBean = MaterialsBean.fromJson(element);
        return MaterialsTile(
          bean: materialsBean,
          isSelected: materialsBean == _materialsBean,
        ).click(() {
          _materialsBean = materialsBean;
          updateState();
        }).rGridTile(3, mainAxisSpacing: kX);
      });
      loadStatusDataEnd(status, list, error);
    });
  }
}
