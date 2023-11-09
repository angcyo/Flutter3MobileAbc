import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

import 'base_abc.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/09
///

class OverlayAbc extends StatefulWidget {
  const OverlayAbc({super.key});

  @override
  State<OverlayAbc> createState() => _OverlayAbcState();
}

class _OverlayAbcState extends State<OverlayAbc> with BaseAbcStateMixin {
  onPressed() {}

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      Wrap(
        children: [
          TextButton(
            onPressed: () {
              showLoading(context: context);
              delayCallback(
                () => hideLoading(),
                const Duration(seconds: 2),
              );
            },
            child: const Text('显示加载'),
          ),
          TextButton(
            onPressed: () {
              hideLoading();
            },
            child: const Text('关闭加载'),
          ),
          TextButton(
            onPressed: () {
              //Loader.show(context);
            },
            child: const Text('Test1'),
          ),
          TextButton(
            onPressed: () {
              //Loader.hide();
            },
            child: const Text('Test2'),
          ),
        ],
      ),
    ];
  }
}
