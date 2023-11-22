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
  late final TextEditingController _accountController =
      TextEditingController(text: "userName");
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var globalConfig = laserPeckerApp.currentState!.globalConfig;
    var backgroundColor = "#f9f9f9".toColor();
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
            .paddingAll(kXh),
        SingleInputWidget(
          controller: _accountController,
          cursorColor: globalConfig.globalTheme.accentColor,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          hintText: "请输入账号",
        ).paddingOnly(left: kXh, right: kXh, top: kXh),
        SingleInputWidget(
          controller: _passwordController,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          hintText: "请输入密码",
        ).paddingAll(kXh),
        SingleInputWidget(
          controller: _passwordController,
          focusBorderColor: globalConfig.globalTheme.accentColor,
          enabled: false,
        ).paddingAll(kXh),
      ].rScroll(),
    );
  }
}
