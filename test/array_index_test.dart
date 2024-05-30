import 'package:flutter3_app/flutter3_app.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/05/30
///
void main() {
  test('test array index', () {
    const width = 5;
    const height = 5;
    final array = List.generate(width * height, (index) => index);

    /*for (var column = 0; column < width; column++) {
      for (var row = 0; row < height; row++) {
        final index = arrayIndex(row, column, width);
        array[index] = column;
      }
    }*/
    _logArray(array, width);

    consoleLog('');

    const startRow = 2;
    const startColumn = 0;
    const subWidth = 3;
    const subHeight = 3;
    final subArray = List.generate(subWidth * subHeight, (index) => index);
    for (var column = 0; column < subWidth; column++) {
      for (var row = 0; row < subHeight; row++) {
        final index = arrayIndex(row, column, subWidth);
        final parentIndex =
            arrayIndexBySub(row, column, startRow, startColumn, width);
        subArray[index] = array[parentIndex];
      }
    }
    _logArray(subArray, subWidth);

    consoleLog('...end');
    return true;
  });
}

/// 通过指定行列索引, 计算数组的索引
int arrayIndex(int row, int column, int width) {
  return row * width + column;
}

/// 在一个父的数组中, 通过指定子数组的行列索引, 计算出在父数组中的索引
int arrayIndexBySub(
  int row,
  int column,
  int parentStartRow,
  int parentStartColumn,
  int parentWidth,
) {
  return (parentStartRow + row) * parentWidth + parentStartColumn + column;
}

void _logArray(List array, int width) {
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < array.length; i++) {
    if (i != 0 && i % width == 0) {
      consoleLog(buffer.toString());
      buffer = StringBuffer();
    }
    buffer.write('${array[i]}'.padRight(6));
  }
  consoleLog(buffer.toString());
}
