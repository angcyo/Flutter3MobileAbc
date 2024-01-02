import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2024/01/02
///
/// 用户相关操作
mixin UserOperateMixin {
  //region 关注用户

  /// 是否正在关注操作请求
  /// 附加的数据, 表示是否请求成功了
  UpdateValueNotifier<bool> isAttentionRequest =
      UpdateValueNotifier(false, null);

  /// 关注或取消关注用户
  Future attentionUser(int? id, {bool attention = true}) {
    isAttentionRequest.value = true;
    return "/square/follow/${attention ? "addUserFollow" : "deleteById"}"
        .post(data: {"fansId": id}).http((value, error) {
      //debugger();
      isAttentionRequest.data = value;
      isAttentionRequest.value = false;
      return value;
    });
  }

  /// 构建关注用户的按钮
  Widget buildAttentionUserWidget(
    BuildContext context,
    bool isAttention,
    int? id, {
    Color? borderColor,
    TextStyle? textStyle,
  }) {
    final globalTheme = GlobalTheme.of(context);
    return LoadingStateWidget(
        isLoading: isAttentionRequest.value,
        child: isAttention
            ? StrokeButton(
                text: "已关注",
                textStyle: textStyle,
                borderColor: borderColor ?? globalTheme.textSubStyle.color,
                onTap: () {
                  //需要取消关注
                  attentionUser(id, attention: !isAttention);
                })
            : StrokeButton(
                text: "关注",
                textStyle: textStyle,
                borderColor: borderColor ?? globalTheme.textSubStyle.color,
                onTap: () {
                  //需要关注
                  attentionUser(id, attention: !isAttention);
                }));
  }

//endregion 关注用户
}
