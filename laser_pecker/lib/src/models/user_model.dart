part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/22
///

class UserModel extends ViewModel {
  String userName = "";

  bool isLogin = false;

  /// 只在登录之后, 才触发
  void wrapLogin(BuildContext context, VoidCallback callback) {
    if (isLogin) {
      //已登录
      callback();
    } else {
      //未登录
      context.pushTranslationRoute(const LoginPage()).get((result, error) {
        if (isLogin) {
          callback();
        }
      });
    }
  }
}
