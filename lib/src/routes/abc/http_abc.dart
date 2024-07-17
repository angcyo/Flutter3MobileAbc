part of '../main_route.dart';

///
/// Email:angcyo@126.com
/// @author angcyo
/// @date 2023/11/25
///

class HttpAbc extends StatefulWidget {
  const HttpAbc({super.key});

  @override
  State<HttpAbc> createState() => _HttpAbcState();
}

class _HttpAbcModel extends ViewModel {
  final MutableLiveData<double?> httpProgress = vmData();
}

class _HttpAbcState extends State<HttpAbc> with BaseAbcStateMixin {
  final TextFieldConfig baseConfig = TextFieldConfig(text: $host);

  final TextFieldConfig url1Config =
      TextFieldConfig(text: "https://www.baidu.com/");

  final TextFieldConfig url2Config = TextFieldConfig(text: "/login");

  //"https://r4---sn-i3b7knzl.gvt1.com/edgedl/android/studio/install/2022.3.1.21/android-studio-2022.3.1.21-mac_arm.dmg"
  final TextFieldConfig url3Config = TextFieldConfig(
      text:
          "https://dldir1.qq.com/qqfile/qq/QQNT/036fe406/QQ_v6.9.22.18394.dmg");

  /// 返回值监听
  final ValueNotifier result = ValueNotifier(null);

  late final _HttpAbcModel _httpAbcModel = _HttpAbcModel();

  /// [isDebug]
  final bool debug = false;

  @override
  void initState() {
    Http.getBaseUrl = () =>
        debug ? "https://alternate.hingin.com" : "https://server.hingin.com";
    super.initState();
  }

  @override
  void dispose() {
    _httpAbcModel.onDispose();
    super.dispose();
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      SingleInputWidget(
        config: baseConfig,
        labelText: "base",
      ).paddingItem(),
      SingleInputWidget(
        config: url1Config,
        labelText: "Url1",
      ).paddingItem(),
      SingleInputWidget(
        config: url2Config,
        labelText: "Url2",
      ).paddingItem(),
      SingleInputWidget(
        config: url3Config,
        labelText: "Url3",
      ).paddingItem(),
      [
        FillGradientButton(
          text: "clear",
          onTap: () => result.value = null,
        ),
        FillGradientButton(
            text: "http-get",
            onTap: () => url1Config.text
                .httpGetContent()
                .get((data, error) => result.value = data ?? error)),
        FillGradientButton(
            text: "dio-get",
            onTap: () => url1Config.text
                .get<String>()
                .get((data, error) => result.value = data?.data ?? error)),
        FillGradientButton(
            text: "dio-post",
            onTap: () => url2Config.text.post<dynamic>(data: {
                  "email": "angcyo@126.com",
                  "credential": "angcyo",
                }).get((data, error) => result.value = data?.data == null
                    ? error
                    : HttpTestBean.fromJson(data?.data))),
        FillGradientButton(
            text: "dio-download",
            onTap: () => url3Config.text
                .download(
                    getSavePath:
                        url3Config.text.basename().filePathOf("downloads"),
                    onReceiveProgress: (count, total) =>
                        _httpAbcModel.httpProgress.value = count / total)
                .get((data, error) => result.value = data?.data ?? error)),
      ].wrap()!.paddingItem(),
      _httpAbcModel.httpProgress.listener((context, progress, error) {
        return LinearProgressIndicator(
          value: progress ?? 0,
        );
      }).paddingItem(),
      result.listener((context) => (result.value?.toString() ?? "--")
          .toHtmlWidget(context)
          .paddingItem()),
      result.listener((context) => (result.value == null
              ? "--"
              : "[${result.value.runtimeType}]${result.value}")
          .text()
          .paddingItem()),
    ];
  }
}
