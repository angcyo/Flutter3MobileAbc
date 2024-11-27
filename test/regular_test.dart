///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/11/18
///
/// 正则测试
void main() {
  //test1();
  test2();
}

void test1() {
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

  //--
  final pair = (true, false);
  print(pair.runtimeType); //(bool, bool)
}

void test2() {
  const text = "M98 P10 L100 L100.101;L200 L200.202";
  final reg = RegExp(r'L(-?\d+(?:\.\d+)?)');
  if (reg.hasMatch(text)) {
    print(
        "count-> ${reg.allMatches(text).map((e) => e.groupCount).join(" ")}"); //count-> 1 1 1 1
    print(
        "group0-> ${reg.allMatches(text).map((e) => e.group(0)).join(" ")}"); //group0-> L100 L100.101 L200 L200.202
    print(
        "group1-> ${reg.allMatches(text).map((e) => e.group(1)).join(" ")}"); //group1-> 100 100.101 200 200.202
    //print("group2-> ${reg.allMatches(text).map((e) => e.group(2)).join(" ")}");//Value not in range: 2
  } else {
    print("no match");
  }
}
