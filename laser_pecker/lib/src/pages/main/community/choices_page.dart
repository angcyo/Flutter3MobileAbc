import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../../models/bean/choices_category_bean.dart';
import 'choices_category_tile.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 精选界面
class ChoicesPage extends StatefulWidget {
  const ChoicesPage({super.key});

  @override
  State<ChoicesPage> createState() => _ChoicesPageState();
}

class _ChoicesPageState extends State<ChoicesPage>
    with RScrollPage, LifecycleAware, LifecycleMixin {
  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  void onLoadData() {
    var globalTheme = GlobalTheme.of(context);
    "/square/material/getSquareMaterialCategoryPageInfo".post(data: {
      ...pageRequestData(),
    }).http((value, error) {
      final list = value?["records"]
          ?.map<Widget>((element) => ChoicesCategoryTile(
                bean: ChoicesCategoryBean.fromJson(element),
              ).click(() {
                toastBlur(text: "点击了${element["name"]}");
              }).rGridTile(
                2,
                childAspectRatio: .85,
                mainAxisSpacing: kXx,
              ))
          .toList();
      loadDataEnd(list, error);
    });
  }
}
