import 'package:flutter/material.dart';
import 'package:flutter3_abc/src/routes/abc/base_abc.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/08
///

class HtmlCssAbc extends StatefulWidget {
  const HtmlCssAbc({super.key});

  @override
  State<HtmlCssAbc> createState() => _HtmlCssAbcState();
}

class _HtmlCssAbcState extends State<HtmlCssAbc> with BaseAbcStateMixin {
  final html1 = """<div>
        <h1>Demo Page</h1>
        <p>This is a fantastic product that you should buy!</p>
        <h3>Features</h3>
        <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
        <!--You can pretty much put any html in here!-->
      </div>""";

  final html2 = """
        <h1>Hello, World!</h1>
        <p><span style="font-style:italic;">flutter_html</span> supports a variety of HTML and CSS tags and attributes.</p>
        <p>Over a hundred static tags are supported out of the box.</p>
        <p>Or you can even define your own using an <code>Extension</code>: <flutter></flutter></p>
        <p>Its easy to add custom styles to your Html as well using the <code>Style</code> class:</p>
        <p class="fancy">Here's a fancy &lt;p&gt; element!</p>
        """;

  final html3 = """
  感谢您选择使用LaserPecker平台！ 通过我们的 <a href='https://faq.hingin.com/docs/service'>"服务条款"</a>和<a href='https://faq.hingin.com/docs/privacy_creation'>"隐私政策"</a>，我们希望帮助 您了解我们提供的服务以及我们如何收集和 处理您的个人信息。点击“同意”表示 您同意上述和以下协议。
  """;

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      Html(
        data: html1,
      ),
      Html(
        data: html2,
        extensions: [
          TagExtension(
            tagsToExtend: {"flutter"},
            child: const FlutterLogo(),
          ),
        ],
        style: {
          "p.fancy": Style(
            textAlign: TextAlign.center,
            padding: HtmlPaddings.all(16),
            backgroundColor: Colors.grey,
            margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
            width: Width(300, Unit.px),
            fontWeight: FontWeight.bold,
          ),
        },
      ),
      Html(
        data: html3,
        onLinkTap: (url, _, __) {
          l.d("Link点击:$url");
        },
        onAnchorTap: (url, _, __) {
          //onAnchorTap 会覆盖 onLinkTap
          l.d("Anchor点击:$url");
        },
        style: {
          "a": Style(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            textDecoration: TextDecoration.none, //去掉下划线
          ),
        },
      ),
    ];
  }
}
