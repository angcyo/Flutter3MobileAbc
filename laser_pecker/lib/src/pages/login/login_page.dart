part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/22
///

/// 账号默认输入的长度
const kAccountLength = 20;

/// 密码默认输入长度
const kPasswordLength = 20;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginModel loginModel = LoginModel();

  final double paddingLeft = kXxh;
  final double paddingRight = kXxh;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginModel.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*var setting = context.routeSettings;
    var data = DataProviderScope.get(context, depend: true);
    if (data is ProxyAnimation) {
      l.i("动画状态:${data.status} 动画的值:${data.value}");
    }*/
    //debugger();
    var globalConfig = laserPeckerApp.currentState!.appGlobalConfig;
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
            .wrapContent(alignment: AlignmentDirectional.centerStart)
            .padding(paddingLeft, paddingLeft, paddingRight, 0),
        SingleInputWidget(
          config: loginModel._accountConfig,
          fillColor: globalConfig.globalTheme.themeWhiteColor,
          cursorColor: globalConfig.globalTheme.accentColor,
          borderColor: Colors.transparent,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          hintText: LPS.of(context).account,
          maxLength: kAccountLength,
        ).padding(paddingLeft, paddingLeft, paddingRight, 0),
        SingleInputWidget(
          config: loginModel._passwordConfig,
          fillColor: globalConfig.globalTheme.themeWhiteColor,
          cursorColor: globalConfig.globalTheme.accentColor,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          borderColor: Colors.transparent,
          hintText: LPS.of(context).password,
          maxLength: kPasswordLength,
        ).padding(paddingLeft, kXh, paddingRight, 0),
        LPS
            .of(context)
            .forgetPassword
            .text(style: TextStyle(color: globalConfig.globalTheme.linkColor))
            .padding(paddingLeft, kH, paddingRight, kH)
            .ink(onTap: () {
              toast("text".text());
            })
            .wrapContent(alignment: AlignmentDirectional.centerEnd)
            .container(),
        [
          loginModel._accountConfig.controller,
          loginModel._passwordConfig.controller,
        ].listener((context) => FillGradientButton(
              text: LPS.of(context).login,
              enabled: loginModel._accountConfig.controller.text.isNotEmpty &&
                  loginModel._passwordConfig.controller.text.isNotEmpty,
              disabledFillColor: globalConfig.globalTheme.whiteSubBgColor,
              gradientColors: [
                globalConfig.globalTheme.primaryColor,
                globalConfig.globalTheme.primaryColorDark,
              ],
              onTap: () => loginModel.login(context),
            ).padding(paddingLeft, kXh, paddingRight, 0)),
        FillGradientButton(
          text: LPS.of(context).register,
          gradientColors: [
            globalConfig.globalTheme.whiteSubBgColor,
            globalConfig.globalTheme.whiteSubBgColor.darkColor,
          ],
          onTap: () => context.pushWidget(const RegisterPage(),
              type: TranslationType.translationFade),
        ).padding(paddingLeft, kXh, paddingRight, 0),
        builder(
          (context) => CheckButton(
            isChecked: loginModel.isAgreePrivacy,
            isCircle: true,
            mainAxisSize: MainAxisSize.max,
            fillColor: globalConfig.globalTheme.primaryColor,
            onChanged: (value) {
              loginModel.isAgreePrivacy = value!;
              context.tryUpdateState();
              //toast("text:$value".text());
            },
            child: LPS.of(context).registerPrivacy.toHtmlWidget(context),
          ),
        ).padding(paddingLeft / 2, kXh, paddingRight / 2, 0),
      ].rScroll(),
    );
  }
}
