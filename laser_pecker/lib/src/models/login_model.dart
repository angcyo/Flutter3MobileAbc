part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/24
///

class LoginModel extends ViewModel {
  late final TextFieldConfig _accountConfig =
      TextFieldConfig(text: "lastAccount".hiveGet());
  late final TextFieldConfig _passwordConfig =
      TextFieldConfig(obscureText: true);

  /// 是否同意了隐私政策
  bool isAgreePrivacy = false;

  /// 开始登录
  void login() {
    if (isAgreePrivacy) {
    } else {
      lpToast('请同意隐私政策'.text());
    }
  }
}
