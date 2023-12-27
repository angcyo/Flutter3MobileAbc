import 'package:flutter/widgets.dart';
import 'package:flutter3_abc/src/routes/main_route.dart';
import 'package:flutter3_abc/src/utils/abc_debug.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/27
///
/// https://github.com/flutterchina/nine_grid_view/blob/master/README-ZH.md

class NineGridAbc extends StatefulWidget {
  const NineGridAbc({super.key});

  @override
  State<NineGridAbc> createState() => _NineGridAbcState();
}

class _NineGridAbcState extends State<NineGridAbc> with BaseAbcStateMixin {
  @override
  List<Widget> buildBodyList(BuildContext context) {
    final width = nextInt(screenWidth.toInt(), min: 40);
    final height = nextInt(screenHeight.toInt(), min: 40);
    return [
      "单图($width*$height)↓".text(textAlign: TextAlign.center),
      // bigImage参数 单张大图建议使用中等质量图片，因为原图太大加载耗时。
      NineGridView(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(5),
          width: width.toDouble(),
          height: height.toDouble(),
          bigImageWidth: width,
          bigImageHeight: height,
          space: 5,
          color: randomColor(),
          type: NineGridType.normal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return randomImageWidget(width: width, height: height);
          }),
      "QQ群样式↓".text(textAlign: TextAlign.center),
      // 头像需要设置宽、高参数。
      NineGridView(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(5),
        space: 5,
        color: randomColor(),
        type: NineGridType.qqGp,
        //NineGridType.weChatGp, NineGridType.dingTalkGp
        itemCount: nextInt(30),
        itemBuilder: (BuildContext context, int index) {
          return randomImageWidget();
        },
      ),
    ];
  }
}
