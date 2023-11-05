import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';
import 'package:flutter3_widgets/flutter3_widgets.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

/// 无状态的Abc
abstract class BaseAbc extends StatelessWidget with BaseAbcMixin {
  const BaseAbc({Key? key}) : super(key: key);
}

/// 无状态带滚动的Abc
abstract class BaseScrollAbc extends BaseAbc {
  const BaseScrollAbc({Key? key}) : super(key: key);
}

/// 无状态的Abc混入
mixin BaseAbcMixin on StatelessWidget {
  /// 构建标题栏
  @protected
  PreferredSizeWidget buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text('$runtimeType'),
      flexibleSpace: linearGradientWidget(
          listOf(themeData.primaryColor, themeData.primaryColorDark)),
    );
  }

  /// 构建内容
  /// ```
  /// return const Placeholder();
  /// ```
  @protected
  Widget buildBody(BuildContext context) {
    return const Placeholder();
  }

  @protected
  List<Widget> buildBodyList(BuildContext context) {
    return [const Placeholder()];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyList = buildBodyList(context);
    Widget body = buildBody(context);
    if (this is BaseScrollAbc) {
      if (bodyList.isEmpty) {
        body = RScrollView([body]);
      } else {
        body = RScrollView(bodyList);
      }
    } else {
      if (bodyList.isNotEmpty) {
        body = Column(
          children: bodyList,
        );
      }
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
    );
  }
}

/// 有状态的Abc混入
mixin BaseAbcStateMixin<T extends StatefulWidget> on State<T> {
  /// 是否使用滚动小部件
  late bool useScroll = false;

  /// 构建标题栏
  @protected
  buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text('${widget.runtimeType}'),
      flexibleSpace: linearGradientWidget(
          listOf(themeData.primaryColor, themeData.primaryColorDark)),
    );
  }

  /// 构建内容
  /// ```
  /// return const Placeholder();
  /// ```
  @protected
  buildBody(BuildContext context) {
    return const Placeholder();
  }

  @protected
  List<Widget> buildBodyList(BuildContext context) {
    return [const Placeholder()];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyList = buildBodyList(context);
    Widget body = buildBody(context);

    if (useScroll) {
      if (bodyList.isEmpty) {
        body = RScrollView([body]);
      } else {
        body = RScrollView(bodyList);
      }
    } else {
      if (bodyList.isNotEmpty) {
        body = Column(
          children: bodyList,
        );
      }
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: body,
    );
  }
}
