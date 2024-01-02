import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/src/models/bean/dynamic_bean.dart';
import 'package:laser_pecker/src/pages/main/community/dynamic_tile.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 动态界面
class DynamicPage extends StatefulWidget {
  /// 排序  1:下载  2点赞 3最新时间
  final ValueNotifier<int?> softTypeValue;

  const DynamicPage({super.key, required this.softTypeValue});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage>
    with RScrollPage, LifecycleAware, LifecycleMixin, RebuildStateEx {
  @override
  void initState() {
    hookRebuild(widget.softTypeValue);
    super.initState();
  }

  @override
  void requestRebuild() {
    startRefreshState();
  }

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    //debugger();
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  void onLoadData() {
    //debugger();
    "/square/posts/getPageInfo".post(data: {
      "type": widget.softTypeValue.value,
      ...pageRequestData(),
    }).http((value, error) {
      final list =
          (value?["records"] as Iterable?)?.mapToList<Widget>((element) {
        final dynamicBean = DynamicBean.fromJson(element);
        return DynamicTile(bean: dynamicBean).click(() {
          toastBlur(text: "${dynamicBean.title}");
        });
      });
      loadDataEnd(list, error);
    });
  }
}
