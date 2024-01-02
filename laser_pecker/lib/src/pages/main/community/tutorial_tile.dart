import 'package:flutter/widgets.dart';
import 'package:flutter3_app/flutter3_app.dart';

import '../../../models/bean/tutorial_bean.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2024/01/02
///
class TutorialTile extends StatelessWidget {
  final TutorialBean? bean;

  const TutorialTile({super.key, this.bean});

  @override
  Widget build(BuildContext context) {
    final globalTheme = GlobalTheme.of(context);
    return [
      bean?.picturePath?.toImageWidget().clipRadius(),
      bean?.title
          ?.text(
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: globalTheme.textBodyStyle
                  .copyWith(fontWeight: FontWeight.bold))
          .paddingAll(kL),
    ].column()!;
  }
}
