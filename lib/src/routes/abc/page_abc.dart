import 'package:flutter/widgets.dart';
import 'package:flutter3_abc/src/routes/abc/base_abc.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../utils/abc_debug.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/07
///

class PageAbc extends StatefulWidget {
  const PageAbc({super.key});

  @override
  State<PageAbc> createState() => _PageAbcState();
}

class _PageAbcState extends State<PageAbc> with BaseAbcStateMixin {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  final PageController pageController2 = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 0.8,
  );

  @override
  List<Widget> buildBodyList(BuildContext context) {
    List<Widget> pages = _buildPage();
    return [
      const Text(
        "PageView↓",
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 100,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              physics: const AlwaysScrollableScrollPhysics(),
              /*physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),*/
              pageSnapping: true,
              //开启后, 只能1页1页滑动. 否则可以直接滑到底
              children: pages,
              onPageChanged: (index) {
                l.w("onPageChanged:$index");
              },
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: PageIndicator(
                    controller: pageController,
                    count: pages.length,
                  ),
                ))
          ],
        ),
      ),
      const Text(
        "PageView viewportFraction↓",
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 100,
        child: PageView(
          controller: pageController2,
          physics: const AlwaysScrollableScrollPhysics(),
          /*physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),*/
          pageSnapping: true,
          //开启后, 只能1页1页滑动. 否则可以直接滑到底
          children: pages,
          onPageChanged: (index) {
            l.w("onPageChanged:$index");
          },
        ),
      ),
      const Text(
        "PageView pageSnapping↓",
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 100,
        child: PageView(
          controller: pageController2,
          physics: const AlwaysScrollableScrollPhysics(),
          /*physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),*/
          pageSnapping: false,
          //开启后, 只能1页1页滑动. 否则可以直接滑到底
          children: pages,
          onPageChanged: (index) {
            l.w("onPageChanged:$index");
          },
        ),
      ),
      const Text(
        "PageView vertical↓",
        textAlign: TextAlign.center,
      ),
      UnconstrainedBox(
        child: SizedBox(
          width: 300,
          height: 200,
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: pageController2,
            pageSnapping: true,
            //开启后, 只能1页1页滑动. 否则可以直接滑到底
            children: pages,
            onPageChanged: (index) {
              l.w("onPageChanged:$index");
            },
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildPage() {
    return [
      randomLogWidget("Page1"),
      randomImageWidget(),
      randomLogWidget("Page3"),
      randomImagePlaceholderWidget(),
      randomLogWidget("Page5"),
      randomImagePlaceholderWidget(),
      randomLogWidget("Page7"),
      randomImagePlaceholderWidget(),
      randomLogWidget("Page8"),
      randomImagePlaceholderWidget(),
      randomLogWidget("Page9"),
      randomImagePlaceholderWidget(),
      randomLogWidget("Page10"),
    ];
  }
}
