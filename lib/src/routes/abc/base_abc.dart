import 'package:flutter/material.dart';
import 'package:flutter3_basics/flutter3_basics.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/02
///

abstract class BaseAbc extends StatelessWidget {
  const BaseAbc({super.key});

  /// 构建标题栏
  @protected
  buildAppBar(BuildContext context) {
    var themeData = Theme.of(context);
    return AppBar(
      title: Text('$runtimeType'),
      flexibleSpace: linearGradientWidget(
          listOf(themeData.primaryColor, themeData.primaryColorDark)),
    );
  }

  /// 构建内容
  @protected
  buildBody(BuildContext context) {
    return const Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }
}
