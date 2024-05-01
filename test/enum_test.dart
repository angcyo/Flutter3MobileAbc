import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2024/05/01
///

enum TestEnum {
  ///测试1
  test1,

  ///测试2
  test2,

  ///测试3
  test3,
}

void main() {
  test('enum test', () {
    print('enum_test1:$TestEnum');
    print('enum_test2:${TestEnum.values[0]}');
    print('enum_test3:${TestEnum.values.getByNameOrNull("test2")}');
    print('enum_test4:${TestEnum.test1.index}');
    print('enum_test5:${TestEnum.test2.name}');
    print('enum_test6:${TestEnum.test3.index}');
  });
}
