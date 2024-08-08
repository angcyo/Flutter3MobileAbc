import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/08
///
class LifecyclePage extends StatefulWidget {
  final String? title;
  final String? content;

  const LifecyclePage({
    super.key,
    this.title,
    this.content,
  });

  @override
  State<LifecyclePage> createState() => _LifecyclePageState();
}

class _LifecyclePageState extends State<LifecyclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "--"),
      ),
      body: Text("LifecyclePage ${widget.content ?? "--"}").click(() {
        context.pushWidget(LifecyclePage(
          title: "Title ${DateTime.now().millisecondsSinceEpoch}",
          content: "Content ${DateTime.now().millisecondsSinceEpoch}",
        ));
      }).center(),
    );
  }
}
