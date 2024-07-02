///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/23
///
/// 多个模块同时使用flutter_intl时, 需要将资源合并到一起.
/// 否则除了第一个模块的资源会根据语言变化, 其他模块的资源都无法改变.

import 'package:flutter3_app/flutter3_app.dart';
import 'package:lp_module/lp_module.dart';

import 'generated/intl/messages_en.dart' as messages_en;
import 'generated/intl/messages_zh.dart' as messages_zh;

/// 合并国际化资源, 后面添加的资源会覆盖之前添加的资源.
/// en资源里面可以添加zh等其他资源, 这样如果en里面没有的资源会自动使用zh资源.
@initialize
void mergeIntl() {
  messages_en.messages.messages
    ..addAll(lpResZhMessages)
    ..addAll(lpResEnMessages)
    ..addAll(libResZhMessages)
    ..addAll(libResEnMessages);

  messages_zh.messages.messages
    ..addAll(lpResZhMessages)
    ..addAll(libResZhMessages);
}
