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
  @override
  Widget build(BuildContext context) {
    var globalConfig = laserPeckerApp.currentState!.globalConfig;
    return Scaffold(
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
      ),
      body: [
        lpSvgWidget(Assets.svg.logo),
      ].rScroll(),
    );
  }
}
