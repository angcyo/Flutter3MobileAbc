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
  List<PopupMenuEntry<String>> buildMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem(
        value: randomText(),
        child: randomTextWidget(length: 5),
      ),
      PopupMenuItem(
        value: randomText(),
        child: randomTextWidget(length: 5),
      ),
      PopupMenuItem(
        value: randomText(),
        child: randomTextWidget(length: 5),
      ),
    ];
  }

  List<Widget> buildMenu2(BuildContext context) {
    return <Widget>[
      MenuItemButton(
        onPressed: onPressed,
        child: randomTextWidget(length: 5),
      ),
      MenuItemButton(
        onPressed: onPressed,
        child: randomTextWidget(length: 5),
      ),
      MenuItemButton(
        onPressed: onPressed,
        child: randomTextWidget(length: 5),
      ),
    ];
  }

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
        "Dialog↓",
        textAlign: TextAlign.center,
      ),
      <Widget>[
        GradientButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierColor: randomColor(),
              builder: (context) {
                return randomWidget(text: randomText());
              },
            );
          },
          child: const Text('showDialog1'),
        ),
        GradientButton(
          onPressed: () {
            showDialog(
              context: context,
              barrierLabel: "barrierLabel",
              barrierDismissible:
                  AbcConfig.getAndIncrementClickCount() % 2 == 0,
              builder: (context) {
                return Align(
                  alignment: Alignment.center,
                  child: randomTextWidget(),
                );
              },
            );
          },
          child: const Text('showDialog2'),
        ),
        GradientButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              barrierLabel: "barrierLabel",
              barrierDismissible:
                  AbcConfig.getAndIncrementClickCount() % 2 == 0,
              builder: (context) {
                return Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints.tightFor(),
                  child: randomTextWidget()
                      .wrapTextStyle()
                      .container(color: randomColor()),
                );
              },
            );
          },
          child: const Text('showCupertinoDialog'),
        ),
        GradientButton(
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierLabel: "barrierLabel",
              barrierDismissible:
                  AbcConfig.getAndIncrementClickCount() % 2 == 0,
              pageBuilder: (context, animation, secondaryAnimation) {
                return Container(
                  alignment: Alignment.center,
                  child: Container(
                    color: randomColor(),
                    child: randomTextWidget().wrapTextStyle(),
                  ),
                );
              },
            );
          },
          child: const Text('showGeneralDialog'),
        ),
        GradientButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog.adaptive(
                  title: const Text('Title'),
                  content: const Text('Content'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('AlertDialog.adaptive'),
        ),
        GradientButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Title'),
                  content: const Text('Content'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ).willPop();
              },
            );
          },
          child: const Text('AlertDialog'),
        ),
        GradientButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: const Text('Title'),
                  content: const Text('Content'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('CupertinoAlertDialog'),
        ),
      ].wrap(),
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
                return randomWidget();
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
                return randomWidget();
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
      const Text(
        "Menu↓",
        textAlign: TextAlign.center,
      ),
      <Widget>[
        PopupMenuButton<String>(
          itemBuilder: buildMenu,
          onSelected: (value) {
            toast(Text(value));
          },
          child: FilledButton(
            onPressed: onPressed,
            child: const Text(
              'menu~',
              textAlign: TextAlign.center,
            ),
          ).ignorePointer(),
        ),
        PopupMenuButton<String>(
          itemBuilder: buildMenu,
          onSelected: (value) {
            toast(Text(value));
          },
          child: const Text(
            'menu~2',
            textAlign: TextAlign.center,
          ).paddingAll(8),
        ),
        MenuAnchor(
          menuChildren: buildMenu2(context),
          builder: (context, controller, child) {
            return GradientButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: const Text(
                  'MenuAnchor~',
                  textAlign: TextAlign.center,
                ).paddingAll(8));
          },
        ),
        PopupMenuButton<String>(
          itemBuilder: (context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
              PopupMenuItem(
                value: randomText(),
                child: randomWidget(),
              ),
            ];
          },
          onSelected: (value) {
            toast(Text(value));
          },
        )
      ].wrap(),
    ];
  }
}
