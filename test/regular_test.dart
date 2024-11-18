///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/11/18
///
/// 正则测试
void main() {
  const text = "G0 X-100 Y101.0001 Z100";
  //正则表达式获取Y100.100
  final reg = RegExp(r'Y(-?\d+(?:\.\d+)?)');
  final match = reg.firstMatch(text);
  final value = match?.group(1);
  print("group0-> ${match?.group(0)}"); //Y100.100
  print("group1-> $value"); //100.100
  print(
      "all-> ${reg.allMatches(text).map((e) => e.group(0)).join()}"); //Y100.100Y200

  //替换
  if (value != null) {
    print(
        "replace-> ${text.replaceAll(reg, "Y${(double.tryParse(value) ?? 0) + 100}")}");
  }
}
