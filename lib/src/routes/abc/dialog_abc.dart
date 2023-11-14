part of flutter_abc;

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/14
///

/// https://api.flutter.dev/flutter/material/BottomSheet-class.html
class DialogAbc extends StatefulWidget {
  const DialogAbc({super.key});

  @override
  State<DialogAbc> createState() => _DialogAbcState();
}

class _DialogAbcState extends State<DialogAbc> with BaseAbcStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    ThemeData newThemeData = themeData.copyWith(
      bottomSheetTheme: themeData.bottomSheetTheme.copyWith(
        showDragHandle: true,
        /*constraints: const BoxConstraints.expand(),*/
      ),
    );
    return Theme(
      data: newThemeData,
      child: super.build(context),
    );
  }

  @override
  List<Widget> buildBodyList(BuildContext context) {
    return [
      const Text(
        "Sheet↓",
        textAlign: TextAlign.center,
      ),
      <Widget>[
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return randomWidget(randomText());
              },
            );
          },
          child: const Text("Sheet1"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet2"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet3"),
        ),
        GradientButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              elevation: 12,
              constraints: const BoxConstraints.expand(),
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("Sheet4"),
        ),
        GradientButton(
          onPressed: () {
            context.push(
              ModalBottomSheetRoute(
                builder: (context) {
                  return BottomSheet(
                      onClosing: onClosing,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsets.all(16),
                          child: Text(randomText(10)),
                        );
                      });
                },
                showDragHandle: true,
                isScrollControlled: true,
                useSafeArea: true,
              ),
            );
          },
          child: const Text("Sheet5"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return randomWidget(randomText());
              },
            );
          },
          child: const Text("SheetModal1"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              elevation: 12,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal2"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              elevation: 12,
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal3"),
        ),
        GradientButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              anchorPoint: Offset.zero,
              constraints: const BoxConstraints.expand(),
              backgroundColor: randomColor(),
              builder: (context) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(randomText(10)),
                );
              },
            );
          },
          child: const Text("SheetModal4"),
        ),
        GradientButton(
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              anchorPoint: Offset.zero,
              builder: (context) {
                return CupertinoActionSheet(
                  title: const Text('Title'),
                  message: const Text('Message'),
                  actions: <CupertinoActionSheetAction>[
                    CupertinoActionSheetAction(
                      /// This parameter indicates the action would be a default
                      /// default behavior, turns the action's text to bold text.
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Default Action'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Action'),
                    ),
                    CupertinoActionSheetAction(
                      /// This parameter indicates the action would perform
                      /// a destructive action such as delete or exit and turns
                      /// the action's text color to red.
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Destructive Action'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text("CupertinoModalPopup1"),
        ),
      ].wrap(),
    ];
  }
}
