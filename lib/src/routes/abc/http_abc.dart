part of flutter_abc;

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

class _HttpAbcState extends State<HttpAbc> with BaseAbcStateMixin {
  final TextFieldConfig url1Config =
      TextFieldConfig(text: "https://www.baidu.com/");

  /// 返回值监听
  final ValueNotifier result = ValueNotifier(null);

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      SingleInputWidget(
        config: url1Config,
        labelText: "Url1",
      ).paddingItem(),
      [
        FillButton(
          text: "clear",
          onTap: () => result.value = null,
        ),
        FillButton(
            text: "http-get",
            onTap: () => url1Config.text
                .getHttpContent()
                .get((data, error) => result.value = data)),
        FillButton(
            text: "dio-get",
            onTap: () => url1Config.text
                .get<String>()
                .get((data, error) => result.value = data?.data)),
      ].wrap().paddingItem(),
      result.listener((context) => (result.value?.toString() ?? "--")
          .toHtmlWidget(context)
          .paddingItem()),
      result.listener(
          (context) => (result.value?.toString() ?? "--").text().paddingItem()),
    ];
  }
}
