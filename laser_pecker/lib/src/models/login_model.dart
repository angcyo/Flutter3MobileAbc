part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/24
///

class LoginModel extends ViewModel {
  static const KEY_LAST_ACCOUNT = "lastAccount";
  static const KEY_LAST_PASSWORD = "lastPassword";

  late final TextFieldConfig _accountConfig =
      TextFieldConfig(text: KEY_LAST_ACCOUNT.hiveGet());
  late final TextFieldConfig _passwordConfig = TextFieldConfig(
      obscureText: true, text: isDebug ? KEY_LAST_PASSWORD.hiveGet() : '');

  /// 是否同意了隐私政策
  bool isAgreePrivacy = isDebug;

  /// 开始登录
  void login(BuildContext context) {
    if (isAgreePrivacy) {
      var isEmail = _accountConfig.text.contains("@");
      wrapLoading("/login".post(data: {
        if (!isEmail) "mobile": _accountConfig.text,
        if (isEmail) "email": _accountConfig.text,
        "credential": _passwordConfig.text,
      })).http((value, error) {
        l.i(value);
        l.w(error);
        if (value != null && error == null) {
          //登录成功
          KEY_LAST_ACCOUNT.hivePut(_accountConfig.text);
          KEY_LAST_PASSWORD.hivePut(_passwordConfig.text);

          var userModel = vmGlobal<UserModel>();
          userModel.onLoginSuccess(value);
          //navigatorState?.pop(value);
          context.pop();
        }
      });
    } else {
      lpToast(LPS.of(context).privacyTip.text());
    }
  }
}
