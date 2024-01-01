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

  /// [BannerBean] 轮播图列表
  MutableErrorLiveData<List<BannerBean>?> bannerListData = vmData(null);

  bool get isLogin => userBeanData.value != null;

  /// 当前用户的token字符串
  String? get token => userBeanData.value?.token;

  String? testData;

  /// 登出后的通知, 会触发一次
  MutableOnceLiveData<bool?> logoutOnceData = vmDataOnce(null);

  /// 只在登录之后, 才触发
  @callPoint
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

  /// 登录页, 用于跳转登录界面, 并且返回是否登录成功
  @callPoint
  Future<bool> wrapLoginPage(BuildContext context) async {
    bool success = false;
    await context
        .pushWidget(const LoginPage(), type: TranslationType.translationFade)
        .get((result, error) {
      success = result != null && error == null;
    });
    return success;
  }

  /// 登录成功后的回调, 使用token更新用户信息
  @callPoint
  void onLoginSuccess(
    dynamic mapValue, {
    bool updateUserInfo = true,
    bool updateFirst = true,
  }) {
    updateUserBean(mapValue);
    if (updateUserInfo) {
      fetchUserInfo();
    }
    if (updateFirst) {
      fetchDeviceList();
      fetchBannerList();
    }
  }

  /// 更新并持久化用户信息
  void updateUserBean(dynamic mapValue) {
    //debugger();
    var userBean = UserBean.fromJson(mapValue);
    userBean.token = userBean.token ?? token;
    userBeanData.value = userBean;
    KEY_USER_BEAN.hivePut(userBean.toJsonString());
  }

  /// 登出
  @callPoint
  void logout(BuildContext context) {
    "loginOut".post().http(null, showErrorToast: false);
    logoutOnceData.value = true;
    context.popToRoot();
    onLogout();
  }

  /// 登出成功后回调
  /// 清除数据
  @callPoint
  void onLogout() {
    KEY_USER_BEAN.hiveDelete();
    userBeanData.value = null;
    bannerListData.value = null;
  }

  /// 从缓存中恢复登录信息, 如果已经登录过
  void restoreLogin() {
    var json = KEY_USER_BEAN.hiveGet<String>();
    if (json?.isNotEmpty == true) {
      onLoginSuccess(json!.fromJson());
    }
  }

  /// 更新用户信息
  @http
  void fetchUserInfo() {
    //debugger();
    //"/user/gatTokenUserInfo"
    "/user/getById".post().http((value, error) {
      if (value != null) {
        updateUserBean(value);
      }
    });
  }

  /// 登录成功之后, 请求连接的设备列表
  @http
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

  /// 获取轮播图列表,
  /// 首次登录之后, 会请求一次
  /// 切换设备之后, 会请求一次
  @http
  void fetchBannerList() {
    //debugger();
    "/banner/getList".post().http((value, error) {
      if (value != null) {
        bannerListData.value =
            value.map<BannerBean>((e) => BannerBean.fromJson(e)).toList();
      } else if (error != null) {
        bannerListData.error = error;
      }
    });
  }
}
