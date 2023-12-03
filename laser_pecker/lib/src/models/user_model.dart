part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/22
///

class UserModel extends ViewModel {
  /// [UserBean]
  MutableLiveData<UserBean?> userBeanData = vmData(null);

  bool get isLogin => userBeanData.value != null;

  String? testData;

  /// 只在登录之后, 才触发
  void wrapLogin(BuildContext context, VoidCallback callback) {
    if (isLogin) {
      //已登录
      callback();
    } else {
      //未登录
      context
          .pushWidget(const LoginPage(), type: TranslationType.translationFade)
          .get((result, error) {
        if (isLogin) {
          callback();
        }
      });
    }
  }
}
