part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/22
///

class UserModel extends ViewModel {
  static const KEY_USER_BEAN = "userBean";

  /// [UserBean] 用户信息
  MutableLiveData<UserBean?> userBeanData = vmData(null);

  /// [ConnectDeviceBean] 连接的设备列表
  MutableErrorLiveData<List<ConnectDeviceBean>?> connectDeviceListData =
      vmData(null);

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

  /// 登录成功后的回调
  void onLoginSuccess(dynamic mapValue) {
    var userBean = UserBean.fromJson(mapValue);
    userBeanData.value = userBean;
    KEY_USER_BEAN.hivePut(userBean.toJsonString());
    fetchDeviceList();
  }

  /// 登出
  void onLogout() {
    KEY_USER_BEAN.hiveDelete();
    userBeanData.value = null;
  }

  /// 从缓存中恢复登录信息, 如果已经登录过
  void restoreLogin() {
    var json = KEY_USER_BEAN.hiveGet<String>();
    if (json?.isNotEmpty == true) {
      onLoginSuccess(json!.fromJson());
    }
  }

  /// 登录成功之后, 请求连接的设备列表
  void fetchDeviceList() {
    //debugger();
    "/device/getByUserId".post().http((value, error) {
      if (value != null) {
        connectDeviceListData.value = value
            .map<ConnectDeviceBean>((e) => ConnectDeviceBean.fromJson(e))
            .toList();
      } else if (error != null) {
        connectDeviceListData.error = error;
      }
    });
  }
}
