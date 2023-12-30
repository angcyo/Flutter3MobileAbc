part of laser_pecker;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/12/26
///

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with AbsScrollPage, LpScrollPageMixin {
  final double paddingLeft = kXxh;
  final double paddingRight = kXxh;

  late final TextFieldConfig accountConfig = TextFieldConfig();
  bool isAgreePrivacy = isDebug;

  @override
  String? getTitle(BuildContext context) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return buildScaffold(context, children: [
      "注册"
          .text(
            textAlign: TextAlign.center,
            style: globalTheme.textTitleStyle.copyWith(fontSize: 24),
          )
          .paddingAll(kXxh),
      SingleInputWidget(
        config: accountConfig,
        fillColor: globalTheme.themeWhiteColor,
        borderColor: Colors.transparent,
        //cursorColor: globalTheme.accentColor,
        //focusBorderColor: globalTheme.accentColor,
        hintText: "请输入手机号或邮箱",
        maxLength: kAccountLength,
      ).padding(paddingLeft, 0, paddingRight, 0),
      builder(
        (context) => CheckButton(
          isChecked: isAgreePrivacy,
          isCircle: true,
          mainAxisSize: MainAxisSize.max,
          fillColor: globalTheme.primaryColor,
          onChanged: (value) {
            isAgreePrivacy = value!;
            context.tryUpdateState();
            //toast("text:$value".text());
          },
          child: LPS.of(context).registerPrivacy.toHtmlWidget(context),
        ),
      ).padding(paddingLeft / 2, kXh, paddingRight / 2, 0),
      accountConfig.controller
          .listener((context) => FillGradientButton(
                text: "获取验证码",
                enabled: accountConfig.text.isNotEmpty,
                disabledFillColor: globalTheme.whiteSubBgColor,
                onTap: () => context.pushWidget(const RegisterPage(),
                    type: TranslationType.translationFade),
              )
                  .matchParent(matchHeight: false)
                  .align(
                    alignment: Alignment.bottomCenter,
                  )
                  .padding(
                      paddingLeft, paddingLeft, paddingRight, paddingRight))
          .rFill(),
    ]);
  }
}
