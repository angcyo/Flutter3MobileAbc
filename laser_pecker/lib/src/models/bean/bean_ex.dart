import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/20
///

extension BeanStringEx on String {
  /// 当前链接是否是外部链接, 也就是需要使用外部浏览器打开
  bool get isExternalUrl =>
      toUri()?.queryParameters["type"]?.toIntOrNull() != 0;
}
