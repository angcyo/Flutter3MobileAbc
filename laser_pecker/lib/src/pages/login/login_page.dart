part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/22
///

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextFieldConfig _accountConfig = TextFieldConfig(text: "userName");
  late final TextFieldConfig _passwordConfig =
      TextFieldConfig(obscureText: true);

  final double paddingLeft = kXxh;
  final double paddingRight = kXxh;

  /// 是否同意了隐私政策
  bool isAgreePrivacy = false;

  @override
  Widget build(BuildContext context) {
    /*var setting = context.routeSettings;
    var data = DataProviderScope.get(context, depend: true);
    if (data is ProxyAnimation) {
      l.i("动画状态:${data.status} 动画的值:${data.value}");
    }*/
    //debugger();
    var globalConfig = laserPeckerApp.currentState!.globalConfig;
    var backgroundColor = globalConfig.globalTheme.whiteBgColor;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: globalConfig.appBarBuilder(
        context,
        this,
        leading: lpSvgWidget(Assets.svg.back)
            .size(
              width: 24,
              height: 24,
            )
            .wrapContent()
            .ink(
                radius: 999,
                onTap: () {
                  context.pop();
                }),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: [
        lpSvgWidget(Assets.svg.logo)
            .wrapContent(AlignmentDirectional.centerStart)
            .padding(paddingLeft, paddingLeft, paddingRight, 0),
        SingleInputWidget(
          config: _accountConfig,
          fillColor: globalConfig.globalTheme.themeWhiteColor,
          cursorColor: globalConfig.globalTheme.accentColor,
          borderColor: Colors.transparent,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          hintText: LPS.of(context).account,
          maxLength: 20,
        ).padding(paddingLeft, paddingLeft, paddingRight, 0),
        SingleInputWidget(
          config: _passwordConfig,
          fillColor: globalConfig.globalTheme.themeWhiteColor,
          cursorColor: globalConfig.globalTheme.accentColor,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          borderColor: Colors.transparent,
          hintText: LPS.of(context).password,
          maxLength: 20,
        ).padding(paddingLeft, kXh, paddingRight, 0),
        LPS
            .of(context)
            .forgetPassword
            .text(style: TextStyle(color: globalConfig.globalTheme.linkColor))
            .padding(paddingLeft, kH, paddingRight, kH)
            .ink(onTap: () {
              toast("text".text());
            })
            .wrapContent(AlignmentDirectional.centerEnd)
            .container(),
        [
          _accountConfig.controller,
          _passwordConfig.controller,
        ].listener((context) => FillButton(
                text: LPS.of(context).login,
                enabled: _accountConfig.controller.text.isNotEmpty &&
                    _passwordConfig.controller.text.isNotEmpty,
                disabledFillColor: globalConfig.globalTheme.whiteSubBgColor,
                gradientColors: [
                  globalConfig.globalTheme.primaryColor,
                  globalConfig.globalTheme.primaryColorDark,
                ]).padding(paddingLeft, kXh, paddingRight, 0)),
        FillButton(text: LPS.of(context).register, gradientColors: [
          globalConfig.globalTheme.whiteSubBgColor,
          globalConfig.globalTheme.whiteSubBgColor.darkColor,
        ]).padding(paddingLeft, kXh, paddingRight, 0),
        builder(
          (context) => CheckButton(
            isChecked: isAgreePrivacy,
            isCircle: true,
            fillColor: globalConfig.globalTheme.primaryColor,
            onChanged: (value) {
              isAgreePrivacy = value!;
              context.tryUpdateState();
              //toast("text:$value".text());
            },
            child: LPS.of(context).registerPrivacy.toHtmlWidget(context),
          ),
        ).padding(paddingLeft / 2, kXh, paddingRight / 2, 0),
        /*SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: false,
        ).paddingAll(kXh),
        SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: true,
        ).paddingAll(kXh),
        SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: true,
        ).paddingAll(kXh),
        SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: true,
        ).paddingAll(kXh),
        SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: true,
        ).paddingAll(kXh),
        SingleInputWidget(
          config: _passwordConfig,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: true,
        ).paddingAll(kXh),*/
      ].rScroll(),
    );
  }
}
