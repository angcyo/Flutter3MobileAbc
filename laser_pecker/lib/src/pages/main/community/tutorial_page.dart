import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';
import 'package:laser_pecker/src/pages/main/community/tutorial_tile.dart';

import '../../../models/bean/tutorial_bean.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/01/01
///
/// 教程界面
class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with RScrollPage, RStatusScrollPage, LifecycleAware, LifecycleMixin {
  /// 网格数量
  int gridCount = 2;

  @override
  void onLifecycleEvent(LifecycleEvent event) {
    l.i("${toRuntimeString()} $event");
    if (event == LifecycleEvent.visible) {
      firstLoad(WidgetState.loading);
    }
  }

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return [
      [
        for (var type in getStatusDataList<String>())
          type
              .text(
                  textAlign: TextAlign.center,
                  fontWeight: isCurrentStatus(type) ? FontWeight.bold : null)
              .constrainedMin(minWidth: 50)
              .padding(kX, kH)
              .container(
                radius: kDefaultBorderRadiusX,
                color: isCurrentStatus(type)
                    ? globalTheme.accentColor
                    : globalTheme.itemWhiteBgColor,
                gradient: isCurrentStatus(type)
                    ? linearGradient([
                        globalTheme.primaryColor,
                        globalTheme.primaryColorDark
                      ])
                    : null,
              )
              .click(() {
            switchStatus(type);
          }),
      ].scroll(gap: kH)?.matchParent(matchHeight: false).container(
            padding: edgeInsets(kX),
            color: globalTheme.themeWhiteColor,
          ),
      super.build(context).expanded(),
    ].column(mainAxisSize: MainAxisSize.max)!;
  }

  @override
  void onLoadStatusList() {
    //debugger();
    "/square/course/getCourseDirectoryList".post().http((value, error) {
      final list = (value as Iterable?)
          ?.mapToList<String>((element) => element.toString());
      loadStatusEnd(list, error);
    });
  }

  @override
  void onLoadStatusData(status) {
    //debugger();
    final bean = status as String;
    "/square/course/getCoursePageInfoByType".post(data: {
      "name": bean,
      ...pageRequestData(),
    }).http((value, error) {
      final list = (value?["records"] as Iterable?)?.mapToList<Widget>((element) {
        final tutorialBean = TutorialBean.fromJson(element);
        return TutorialTile(bean: tutorialBean).click(() {
          toastBlur(text: "${tutorialBean.title}");
        }).rGridTile(
          gridCount,
          childAspectRatio: 0.8115,
          mainAxisSpacing: kX,
        );
      });
      loadStatusDataEnd(status, list, error);
    });
  }
}
