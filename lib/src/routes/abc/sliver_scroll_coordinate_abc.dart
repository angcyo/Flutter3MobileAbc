import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/22
///
class SliverScrollCoordinateAbc extends StatefulWidget {
  const SliverScrollCoordinateAbc({super.key});

  @override
  State<SliverScrollCoordinateAbc> createState() =>
      _SliverScrollCoordinateAbcState();
}

const _height = 50.0;

class _SliverScrollCoordinateAbcState extends State<SliverScrollCoordinateAbc>
    with TickerProviderStateMixin, TabLayoutMixin {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);

    const avatarSize = 50.0;
    const avatarMinSize = 30.0;
    final avatarRect =
        Rect.fromLTWH(10, screenStatusBar, avatarSize, avatarSize);
    return EasyRefresh(
        /*notificationPredicate: (notification) {
          return notification.depth == 0;
        },*/
        /*onRefresh: () async {
          return Future.delayed(2.seconds);
        },*/
        onRefresh: () {
          return Future.delayed(2.seconds);
        },
        child: NestedScrollView(
          controller: controller,
          /*physics: const BouncingScrollPhysics(),*/
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: "title".text(),
              ),
              SliverScrollCoordinateLayoutWidget(
                minExtent: 140,
                maxExtent: 400,
                children: [
                  DecoratedBox(
                      decoration: BoxDecoration(
                    gradient: linearGradient(
                        ["#fce14a".toColor(), "#fccc39".toColor()]),
                  )).matchParent(),
                  const DecoratedBox(
                          decoration: BoxDecoration(
                    color: Colors.white,
                  ))
                      .matchParentWidth()
                      .clipRadius(topRadius: kDefaultBorderRadiusXX)
                      .sliverCoordinateLayoutParentData(
                        bottom: 0,
                        height: 50,
                        onCoordinateLayoutAction:
                            (constraints, parentData, scrollProgress) {
                          parentData.height = 50 + (100 - 50) * scrollProgress;
                          return true;
                        },
                      ),
                  buildTabLayout(context, children: [
                    "本地".text().padding(kH, kH),
                    "我的空间".text().padding(kH, kH),
                    "SD卡".text().padding(kH, kH),
                  ]).paddingAll(kH).sliverCoordinateLayoutParentData(bottom: 0),
                  SliverScrollCoordinateLayoutParentDataWidget(
                      left: avatarRect.left,
                      top: avatarRect.top,
                      width: avatarRect.width,
                      height: avatarRect.height,
                      onCoordinateLayoutAction:
                          (constraints, parentData, scrollProgress) {
                        //l.d('$scrollProgress');
                        final avatarTargetRect = Rect.fromLTWH(
                            constraints.crossAxisExtent / 2 - avatarMinSize / 2,
                            avatarRect.top,
                            avatarMinSize,
                            avatarMinSize);
                        final rect =
                            avatarRect.lerp(avatarTargetRect, scrollProgress);
                        parentData
                          ..left = rect.left
                          ..top = rect.top
                          ..width = rect.width
                          ..height = rect.height;
                        return true;
                      },
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.redAccent),
                        child: IconButton(
                            onPressed: () {
                              toastBlur(text: "button...${nowTimeString()}");
                            },
                            icon: const Icon(Icons.supervised_user_circle)),
                      ).size(size: 50).clipOval()),
                  [
                    GradientButton.normal(() {
                      controller.scrollToTop(offset: 400);
                    }, child: "收起".text()),
                    GradientButton.normal(() {
                      controller.scrollToTop();
                    }, child: "展开".text())
                  ]
                      .row(gap: kX, mainAxisSize: MainAxisSize.min)!
                      .sliverCoordinateLayoutParentData(
                          right: 0, top: screenStatusBar),
                ],
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverList.builder(
                  itemBuilder: (context, index) {
                    //l.d('build->$index');
                    return Text('$index')
                        .container(
                          padding: const EdgeInsets.all(kX),
                          alignment: Alignment.centerLeft,
                          height: _height,
                        )
                        .ink(
                          () {},
                          splashColor: Colors.redAccent,
                          backgroundColor: Color.fromARGB(
                            0xff,
                            0xff - index * 10,
                            0xff - index * 10,
                            0xff - index * 10,
                          ),
                        );
                  },
                  itemCount: 100),
            ],
          ),
        )).scaffold(backgroundColor: globalTheme.surfaceBgColor);
  }
}
