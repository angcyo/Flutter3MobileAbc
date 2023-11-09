import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter3_widgets/flutter3_widgets.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

/// 有状态的Abc混入
mixin BaseAbcStateMixin<T extends StatefulWidget> on State<T> {
  /// 构建标题栏
  String? title;

  /// 是否使用滚动小部件[RScrollView]
  bool useScroll = true;

  /// [RScrollView.enableFrameLoad]
  bool enableFrameLoad = false;

  /// [RScrollView.frameSplitDuration]
  Duration frameSplitDuration = const Duration(milliseconds: 16);

  /// 构建标题栏
  @protected
  PreferredSizeWidget buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text(title ?? '${widget.runtimeType}'),
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
    return [];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyList = buildBodyList(context);
    Widget body = buildBody(context);

    if (useScroll) {
      //使用滚动小部件
      if (bodyList.isEmpty) {
        body = RScrollView(
          [body],
          enableFrameLoad: enableFrameLoad,
          frameSplitDuration: frameSplitDuration,
        );
      } else {
        body = RScrollView(
          bodyList,
          enableFrameLoad: enableFrameLoad,
          frameSplitDuration: frameSplitDuration,
        );
      }
    } else {
      if (bodyList.isNotEmpty) {
        //有多个child, 则使用Column包裹起来
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
