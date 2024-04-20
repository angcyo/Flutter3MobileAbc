part of '../main_route.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/11/05
///

/*class WidgetAbc extends BaseAbc {
  const WidgetAbc({super.key});

  @override
  buildBody(BuildContext context) {
    return AfterLayout(
        callback: (parentContext, childRenderObject) {
          l.d('AfterLayout[${childRenderObject?.getRenderObjectBounds(context.findRenderObject())}]->↓\n$parentContext\n$childRenderObject');
        },
        child: randomWidget("...test..."));
  }
}*/

class WidgetAbc extends StatefulWidget {
  const WidgetAbc({super.key});

  @override
  State<WidgetAbc> createState() => _WidgetAbcState();
}

class _WidgetAbcState extends State<WidgetAbc> with BaseAbcStateMixin {
  bool _isSet = false;
  String _sizeText = "...test...";
  late double height;

  @override
  void initState() {
    useScroll = true;
    height =
        nextDouble(kMinInteractiveDimension, platformMediaQueryData.size.width);
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return AfterLayout(
        afterLayoutAction: (parentContext, childRenderBox) {
          postFrameCallback((duration) {
            final bounds =
                childRenderBox.getGlobalBounds(context.findRenderObject());
            l.d('AfterLayout[$bounds]->↓\n$parentContext\n$childRenderBox');
            final newText = bounds.toString();
            if (_sizeText != newText) {
              setState(() {
                _sizeText = newText;
              });
            }
          });
        },
        child: randomWidget(text: _sizeText, height: height));
  }
}
