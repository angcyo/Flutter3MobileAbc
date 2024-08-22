import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @date 2024/08/22
///
class NestedScrollViewAbc extends StatefulWidget {
  const NestedScrollViewAbc({super.key});

  @override
  State<NestedScrollViewAbc> createState() => _NestedScrollViewAbcState();
}

const _height = 50.0;

class _NestedScrollViewAbcState extends State<NestedScrollViewAbc> {
  Widget _buildSliverBox() => SliverToBoxAdapter(
        child: const Text('SliverToBoxAdapter').container(
          color: Colors.redAccent,
          padding: const EdgeInsets.all(kX),
          alignment: Alignment.centerLeft,
          height: _height,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text('NestedScrollViewAbc[$innerBoxIsScrolled]'),
          ),
          SliverAppBar(
            title: Text('...[$innerBoxIsScrolled]'),
          ),
          const SliverLogWidget(),
          //_buildSliverBox(),
        ];
      },
      body: CustomScrollView(
        slivers: [
          //const SliverLogWidget(),
          //const SliverLogWidget(),
          //_buildSliverBox(),
          SliverList.builder(
              itemBuilder: (context, index) {
                //l.d('build->$index');
                return Text('$index').container(
                  color: Color.fromARGB(
                    0xff,
                    0xff - index * 10,
                    0xff - index * 10,
                    0xff - index * 10,
                  ),
                  padding: const EdgeInsets.all(kX),
                  alignment: Alignment.centerLeft,
                  height: _height,
                );
              },
              itemCount: 100),
        ],
      ),
    ).scaffold(backgroundColor: globalTheme.surfaceBgColor);
  }
}

class SliverLogWidget extends LeafRenderObjectWidget {
  const SliverLogWidget({super.key});

  @override
  RenderObject createRenderObject(BuildContext context) => RenderSliverLog();
}

/// [RenderSliverOverlapAbsorber]
/// [RenderSliverOverlapInjector]
/// [SliverPaintRender]
/// [RenderSliverToBoxAdapter]
class RenderSliverLog extends RenderSliver {
  RenderSliverLog();

  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! SliverPhysicalParentData) {
      child.parentData = SliverPhysicalParentData();
    }
  }

  @override
  double childMainAxisPosition(RenderBox child) {
    debugger();
    return -constraints.scrollOffset;
  }

  @override
  void applyPaintTransform(RenderObject child, Matrix4 transform) {
    debugger();
    final SliverPhysicalParentData childParentData =
        child.parentData! as SliverPhysicalParentData;
    childParentData.applyPaintTransform(transform);
  }

  @override
  void performLayout() {
    final constraints = this.constraints;
    //l.v(constraints);

    /*geometry = SliverGeometry(
      */ /*paintOrigin: -constraints.scrollOffset,*/ /*
      paintExtent: _height,
      cacheExtent: _height,
      maxPaintExtent: _height,
      scrollExtent: _height,
      layoutExtent: _height,
      hasVisualOverflow: false,
      */ /*maxScrollObstructionExtent: 130,*/ /*
    );*/

    //一般布局使用
    /*geometry = SliverGeometry(
      paintOrigin: -constraints.scrollOffset,
      paintExtent: _height,
      maxPaintExtent: _height,
      layoutExtent: _height,
    );*/

    final double childExtent = switch (constraints.axis) {
      Axis.horizontal => _height,
      Axis.vertical => _height,
    };
    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);
    //debugger();
    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    //debugger();
    l.d("offset:$offset scrollOffset:${constraints.scrollOffset} paintBounds:$paintBounds");
    context.canvas.drawRect(
      paintBounds + offset/* + Offset(0.0, -constraints.scrollOffset)*/,
      Paint()..color = Colors.blueAccent,
    );
  }
}
