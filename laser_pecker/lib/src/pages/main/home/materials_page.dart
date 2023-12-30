import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/laser_pecker.dart';

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
    with AbsScrollPageMixin, LpScrollPageMixin {
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
  Widget build(BuildContext context) {
    return buildScaffold(context, []);
  }
}
