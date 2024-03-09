///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/07
///
library;

abstract final class AbcConfig {
  static int _clickCount = 0;

  /// 获取点击次数
  static int getAndIncrementClickCount() {
    return _clickCount++;
  }
}